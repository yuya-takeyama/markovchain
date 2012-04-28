# coding: utf-8
require 'markovchain/corpus'

describe Markovchain::Corpus do
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
  end
end
