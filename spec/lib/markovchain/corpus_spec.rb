# coding: utf-8
require 'markovchain/corpus'

describe Markovchain::Corpus do
  describe '#prev_phrase' do
    subject { corpus.prev_phrase }

    context '1-gram' do
      let(:corpus) { Markovchain::Corpus.new 1 }

      context 'by default' do
        it { should == non_word }
      end

      context 'feeded "a"' do
        before { corpus.feed_char('a') }

        it { should == 'a' }
      end
    end

    context '2-gram' do
      let(:corpus) { Markovchain::Corpus.new 2 }

      context 'by default' do
        it { should == non_word * 2 }
      end

      context 'feeded "a"' do
        before { corpus.feed_char('a') }

        it { should == non_word + 'a' }
      end

      context 'feeded "a", "b"' do
        before {
          corpus.feed_char('a')
          corpus.feed_char('b')
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

      context 'feeded "a"' do
        before { corpus.feed('a') }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {non_word => 1},
          }
        }
      end

      context 'feeded "ab"' do
        before { corpus.feed('ab') }

        it {
          should == {
            non_word => {'a' => 1},
            'a' => {'b' => 1},
            'b' => {non_word => 1},
          }
        }
      end

      context 'feeded "abc"' do
        before { corpus.feed('abc') }

        it {
          should == {
            non_word => {'a' => 1},
            'a' => {'b' => 1},
            'b' => {'c' => 1},
            'c' => {non_word => 1},
          }
        }
      end
    end
  end
end
