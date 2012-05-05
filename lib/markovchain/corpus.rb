require 'markovchain'

class Markovchain
  class Corpus
    attr_reader :prev_sequence, :storage

    def initialize(gram)
      @gram = gram
      @storage = {}
      @prev_sequence = NON_WORD * gram
    end

    def seed(sequence)
      sequence.each_char do |token|
        seed_token(token)
      end
      finalize_seeding
    end

    def seed_token(token)
      increment(token)
      @prev_sequence = @prev_sequence[1, @gram - 1] + token
    end

    private
    def increment(token)
      @storage[@prev_sequence] = {}      unless @storage.key? @prev_sequence
      @storage[@prev_sequence][token] = 0 unless @storage[@prev_sequence].key? token
      @storage[@prev_sequence][token] += 1
    end

    def finalize_seeding
      increment(NON_WORD)
    end
  end
end
