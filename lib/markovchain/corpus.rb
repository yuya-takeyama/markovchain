require 'markovchain'

class Markovchain
  class Corpus
    attr_reader :prev_phrase

    def initialize(gram)
      @gram = gram
      @prev_phrase = NON_WORD * gram
    end

    def feed_char(char)
      @prev_phrase = @prev_phrase[1, @gram - 1] + char
    end
  end
end
