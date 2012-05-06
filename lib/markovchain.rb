require 'markovchain/corpus'

class Markovchain
  attr_reader :corpus

  NON_WORD = "\0"

  def initialize(options = {})
    @state_size = options[:state_size] || 2
    @corpus     = Corpus.new(
      :state_size => @state_size,
      :storage    => options[:storage] || nil,
    )
  end

  def seed(sequence)
    @corpus.seed sequence
  end

  def random_sequence
    result = ''
    token = nil
    prev_sequence = NON_WORD * @state_size
    while token != NON_WORD
      token = random_pick(@corpus.tokens_after(prev_sequence))
      result += token unless token == NON_WORD
      prev_sequence = prev_sequence[1, @state_size - 1] + token
    end
    result
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
