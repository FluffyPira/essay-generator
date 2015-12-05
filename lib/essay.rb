#!/usr/bin/env ruby

require 'marky_markov'

WORDS = 5..20 # per sentence
SENTENCES = 4..10 # per paragraph
PARAGRAPHS = 2..7 # per essay

class Essay
  
  def initialize(dictionary=nil)
    dictionary ||= "dictionary/dictionary.txt"

    @essay = MarkyMarkov::TemporaryDictionary.new(2)
    @essay.parse_file dictionary
  end
    
  def word_generate(number)
    sentence = @essay.generate_n_words number
    sentence.gsub(/[^a-z0-9 ]/i, '')
  end

  def sentence_generate(sentences=1)
    words = rand(WORDS)
    sentences.times.map { |x| word_generate(words) }
  end

  def paragraph_generate
    sentences = rand(SENTENCES)
    words = sentence_generate(sentences)
    string = words.map(&:capitalize)
    string.join('. ')
  end
  
  def generate
    rand(PARAGRAPHS).times.map { paragraph_generate + ".\n\n" }
  end
    
end
