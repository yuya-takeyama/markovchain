# coding: utf-8
require 'markovchain'

describe Markovchain do
  describe '#corpus' do
    subject { chain.corpus.storage.to_h }

    context 'with 1-gram' do
      let(:chain) { Markovchain.new 1 }

      context 'by default' do
        it { should == {} }
      end

      context 'seeded "a"' do
        before { chain.seed("a") }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {non_word => 1},
          }
        }
      end

      context 'seeded "ab"' do
        before { chain.seed("ab") }

        it {
          should == {
            non_word => {"a" => 1},
            "a" => {"b" => 1},
            "b" => {non_word => 1},
          }
        }
      end

      context 'seeded "abcde"' do
        before { chain.seed("abcde") }

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
