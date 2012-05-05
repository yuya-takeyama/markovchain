require 'markovchain'
require 'markovchain/storage/memory'

class Markovchain
  class Corpus
    attr_reader :prev_sequence, :storage

    def initialize(options = {})
      @state_size = options[:state_size]
      @storage    = options[:storage] || ::Markovchain::Storage::Memory.new
    end

    def seed(sequence)
      @prev_sequence = NON_WORD * @state_size
      sequence.each_char do |token|
        seed_token(token)
      end
      finalize_seeding
    end

    def seed_token(token)
      increment(token)
      @prev_sequence = @prev_sequence[1, @state_size - 1] + token
    end

    def tokens_after(sequence)
      @storage.tokens_after(sequence)
    end

    private
    def increment(token)
      @storage.increment(@prev_sequence, token)
    end

    def finalize_seeding
      @storage.increment(@prev_sequence, NON_WORD)
    end
  end
end
