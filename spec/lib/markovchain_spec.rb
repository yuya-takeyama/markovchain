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

        it { should == {nil => {"a" => 1}, "a" => {nil => 1}} }
      end

      context 'feeded "ab"' do
        before { chain.feed("ab") }

        it { should == {nil => {"a" => 1}, "a" => {"b" => 1}, "b" => {nil => 1}} }
      end

      context 'feeded "abcde"' do
        before { chain.feed("abcde") }

        it { should == {
          nil => {"a" => 1},
          "a" => {"b" => 1},
          "b" => {"c" => 1},
          "c" => {"d" => 1},
          "d" => {"e" => 1},
          "e" => {nil => 1},
        } }
      end
    end
  end
end
