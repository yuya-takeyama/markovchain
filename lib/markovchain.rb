class Markovchain
  attr_reader :corpus

  def initialize(gram)
    @gram = gram
    @corpus = {}
  end

  def feed(phrase)
  end
end
