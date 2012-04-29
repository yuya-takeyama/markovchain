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
      increment(char)
      @prev_phrase = @prev_phrase[1, @gram - 1] + char
    end

    private
    def increment(char)
      @storage[@prev_phrase] = {}      unless @storage.key? @prev_phrase
      @storage[@prev_phrase][char] = 0 unless @storage[@prev_phrase].key? char
      @storage[@prev_phrase][char] += 1
    end

    def finalize_feeding
      increment(NON_WORD)
    end
  end
end
