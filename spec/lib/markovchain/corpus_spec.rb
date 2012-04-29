# coding: utf-8
require 'markovchain/corpus'

describe Markovchain::Corpus do
  NON_WORD = Markovchain::NON_WORD

  describe '#prev_phrase' do
    subject { corpus.prev_phrase }

    context '1-gram' do
      let(:corpus) { Markovchain::Corpus.new 1 }

      context 'by default' do
        it { should == Markovchain::NON_WORD }
      end

      context 'feeded "a"' do
        before { corpus.feed_char('a') }

        it { should == 'a' }
      end
    end

    context '2-gram' do
      let(:corpus) { Markovchain::Corpus.new 2 }

      context 'by default' do
        it { should == NON_WORD * 2 }
      end

      context 'feeded "a"' do
        before { corpus.feed_char('a') }

        it { should == NON_WORD + 'a' }
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
end
