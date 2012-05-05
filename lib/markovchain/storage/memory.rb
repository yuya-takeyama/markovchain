module Markovchain::Storage
  class Memory
    def initialize
      @data = {}
    end

    def tokens_after(sequence)
      @data[sequence] || {}
    end

    def increment(prev_sequence, token)
      @data[prev_sequence] = {}       unless @data.key? prev_sequence
      @data[prev_sequence][token] = 0 unless @data[prev_sequence].key? token
      @data[prev_sequence][token] += 1
    end
  end
end
