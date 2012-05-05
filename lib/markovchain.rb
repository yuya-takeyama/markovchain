require 'markovchain/corpus'

class Markovchain
  attr_reader :corpus

  NON_WORD = "\0"

  def initialize(gram)
    @corpus = Markovchain::Corpus.new gram
  end

  def seed(phrase)
    @corpus.seed phrase
  end
end
