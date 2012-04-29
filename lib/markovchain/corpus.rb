require 'markovchain'

class Markovchain
  class Corpus
    attr_reader :prev_phrase, :storage

    def initialize(gram)
      @gram = gram
      @storage = {}
      @prev_phrase = NON_WORD * gram
    end

    def feed_char(char)
      @prev_phrase = @prev_phrase[1, @gram - 1] + char
    end
  end
end
