require 'markovchain/storage/memory'

module Markovchain::Storage
  describe Memory do
    describe '#tokens_after' do
      subject { storage.tokens_after(sequence) }
      let(:storage) { Markovchain::Storage::Memory.new }
      let(:sequence) { 'foo' }

      context 'when no records matched' do
        it { should == {} }
      end

      context 'when a record matched' do
        before { storage.increment(sequence, token) }
        let(:token) { 'b' }
        it { should == {'b' => 1} }
      end

      context 'when many token seeded' do
        before do
          storage.increment(sequence, 'a')
          storage.increment(sequence, 'a')
          storage.increment(sequence, 'a')
          storage.increment(sequence, 'b')
          storage.increment(sequence, 'b')
          storage.increment(sequence, 'c')
        end
        it { should == {'a' => 3, 'b' => 2, 'c' => 1} }
      end
    end
  end
end
