require 'markovchain'

class Markovchain
  class Corpus
    NON_WORD = ::Markovchain::NON_WORD

    attr_reader :prev_char

    def initialize(gram)
      @gram = gram
    end

    def feed_char(char)
    end
  end
end
