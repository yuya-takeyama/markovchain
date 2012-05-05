# coding: utf-8
require 'markovchain/corpus'

describe Markovchain::Corpus do
  describe '#prev_sequence' do
    subject { corpus.prev_sequence }

    context '1-gram' do
      let(:corpus) { Markovchain::Corpus.new 1 }

      context 'by default' do
        it { should == non_word }
      end

      context 'seeded "a"' do
        before { corpus.seed_token('a') }

        it { should == 'a' }
      end
    end

    context '2-gram' do
      let(:corpus) { Markovchain::Corpus.new 2 }

      context 'by default' do
        it { should == non_word * 2 }
      end

      context 'seeded "a"' do
        before { corpus.seed_token('a') }

        it { should == non_word + 'a' }
      end

      context 'seeded "a", "b"' do
        before {
          corpus.seed_token('a')
          corpus.seed_token('b')
        }

        it { should == 'ab' }
      end
    end
  end

  describe '#storage' do
    subject { corpus.storage }

    context '1-gram' do
      let(:corpus) { Markovchain::Corpus.new 1 }

      context 'by default' do
        it { should == {} }
      end

      context 'seeded "a"' do
        before { corpus.seed('a') }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {non_word => 1},
          }
        }
      end

      context 'seeded "ab"' do
        before { corpus.seed('ab') }

        it {
          should == {
            non_word => {'a' => 1},
            'a' => {'b' => 1},
            'b' => {non_word => 1},
          }
        }
      end

      context 'seeded "abc"' do
        before { corpus.seed('abc') }

        it {
          should == {
            non_word => {'a' => 1},
            'a' => {'b' => 1},
            'b' => {'c' => 1},
            'c' => {non_word => 1},
          }
        }
      end

      context 'seeded "aaa"' do
        before { corpus.seed('aaa') }

        it {
          should == {
            non_word => {'a' => 1},
            'a' => {
              'a' => 2,
              non_word => 1,
            },
          }
        }
      end
    end
  end
end
