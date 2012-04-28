require 'markovchain'

class Markovchain
  class Corpus
    NON_WORD = ::Markovchain::NON_WORD

    attr_reader :prev_phrase

    def initialize(gram)
      @gram = gram
      @prev_phrase = NON_WORD
    end

    def feed_char(char)
      @prev_phrase = char
    end
  end
end
