# coding: utf-8

describe Markovchain do
  describe '#corpus' do
    subject { chain.corpus }

    context 'with 1-gram' do
      let(:chain) { Markovchain.new 1 }

      context 'by default' do
        it { should == {} }
      end

      context 'feeded "a"' do
        before { chain.feed("a") }

        it { pending; should == {nil => {"a" => 1}, "a" => {nil => 1}} }
      end
    end
  end
end
