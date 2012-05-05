require 'markovchain/corpus'

class Markovchain
  attr_reader :corpus

  NON_WORD = "\0"

  def initialize(gram)
    @gram   = gram
    @corpus = Markovchain::Corpus.new gram
  end

  def seed(sequence)
    @corpus.seed sequence
  end

  def random_sequence
    result = ''
    token = nil
    prev_sequence = NON_WORD * @gram
    while token != NON_WORD
      p prev_sequence
      token = random_pick(@corpus.tokens_after(prev_sequence))
      result += token unless token == NON_WORD
      prev_sequence = prev_sequence[1, @gram - 1] + token
    end
  end

  private
  def random_pick(tokens)
    choices = []
    tokens.each do |token, weight|
      weight.times do
        choices.push token
      end
    end
    choices.sample
  end
end
