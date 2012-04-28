class Markovchain
  attr_reader :corpus

  NON_WORD = nil

  def initialize(gram)
    @gram = gram
    @corpus = {}
    @prev_char = NON_WORD
  end

  def feed(phrase)
    phrase.each_char do |char|
      @corpus[@prev_char] = {char => 1}
      @prev_char = char
    end
    @corpus[@prev_char] = {NON_WORD => 1}
  end
end
