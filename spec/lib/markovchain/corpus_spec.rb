# coding: utf-8
require 'markovchain/corpus'

describe Markovchain::Corpus do
  describe '#prev_char' do
    subject { corpus.prev_char }

    context '1-gram' do
      let(:corpus) { Markovchain::Corpus.new 1 }

      context 'by default' do
        it { should == Markovchain::NON_WORD }
      end
    end
  end
end
