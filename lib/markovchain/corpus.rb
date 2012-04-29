require 'markovchain'

class Markovchain
  class Corpus
    attr_reader :prev_phrase, :storage

    def initialize(gram)
      @gram = gram
      @storage = {}
      @prev_phrase = NON_WORD * gram
    end

    def feed(phrase)
      phrase.each_char do |char|
        feed_char(char)
      end
      finalize_feeding
    end

    def feed_char(char)
      @storage[@prev_phrase] = {char => 1}
      @prev_phrase = @prev_phrase[1, @gram - 1] + char
    end

    private
    def finalize_feeding
      @storage[@prev_phrase] = {NON_WORD => 1}
    end
  end
end
