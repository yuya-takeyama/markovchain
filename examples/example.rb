#!/usr/bin/env ruby
# coding: utf-8
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'markovchain'

markov = Markovchain.new 2
markov.seed 'To be or not to be'
markov.seed 'Too drunk to fuck'
markov.seed 'Shut the fuck up and write some code'

puts markov.random_sequence
