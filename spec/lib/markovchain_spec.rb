# coding: utf-8
require 'markovchain'

describe Markovchain do
  NON_WORD = Markovchain::NON_WORD

  describe '#corpus' do
    subject { chain.corpus }

    context 'with 1-gram' do
      let(:chain) { Markovchain.new 1 }

      context 'by default' do
        it { should == {} }
      end

      context 'feeded "a"' do
        before { chain.feed("a") }

        it {
          should == {
            NON_WORD => {"a" => 1},
            "a" => {NON_WORD => 1},
          }
        }
      end

      context 'feeded "ab"' do
        before { chain.feed("ab") }

        it {
          should == {
            NON_WORD => {"a" => 1},
            "a" => {"b" => 1},
            "b" => {NON_WORD => 1},
          }
        }
      end

      context 'feeded "abcde"' do
        before { chain.feed("abcde") }

        it {
          should == {
            NON_WORD => {"a" => 1},
            "a" => {"b" => 1},
            "b" => {"c" => 1},
            "c" => {"d" => 1},
            "d" => {"e" => 1},
            "e" => {NON_WORD => 1},
          }
        }
      end
    end
  end
end
