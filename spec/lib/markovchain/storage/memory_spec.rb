require 'markovchain/storage/memory'

module Markovchain::Storage
  describe Memory do
    describe '#tokens_after' do
      subject { storage.tokens_after(sequence) }
      let(:storage) { Markovchain::Storage::Memory.new }

      context 'when no records matched' do
        let(:sequence) { 'foo' }
        it { should == {} }
      end

      context 'when a record matched' do
        before { storage.increment(sequence, token) }
        let(:sequence) { 'foo' }
        let(:token) { 'b' }
        it { should == {'b' => 1} }
      end
    end
  end
end
