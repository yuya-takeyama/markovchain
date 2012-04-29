require 'markovchain/corpus'

class Markovchain
  attr_reader :corpus

  NON_WORD = "\0"

  def initialize(gram)
    @corpus = Markovchain::Corpus.new gram
  end

  def feed(phrase)
    @corpus.feed phrase
  end
end
