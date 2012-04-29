# coding: utf-8
require 'markovchain'

describe Markovchain do
  describe '#corpus' do
    subject { chain.corpus.storage }

    context 'with 1-gram' do
      let(:chain) { Markovchain.new 1 }

      context 'by default' do
        it { should == {} }
      end

      context 'feeded "a"' do
        before { chain.feed("a") }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {non_word => 1},
          }
        }
      end

      context 'feeded "ab"' do
        before { chain.feed("ab") }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {"b" => 1},
            "b" => {non_word => 1},
          }
        }
      end

      context 'feeded "abcde"' do
        before { chain.feed("abcde") }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {"b" => 1},
            "b" => {"c" => 1},
            "c" => {"d" => 1},
            "d" => {"e" => 1},
            "e" => {non_word => 1},
          }
        }
      end
    end
  end
end
