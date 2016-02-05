#!/usr/bin/env ruby

require 'marky_markov'
require 'configru'

config = Configru::Config.new('lib/config.yml') do
  option_group :words do
    option_required :high, Fixnum
    option_required :low, Fixnum
  end
  option_group :sentences do
    option_required :high, Fixnum
    option_required :low, Fixnum
  end
  option_group :paragraphs do
    option_required :high, Fixnum
    option_required :low, Fixnum
  end
end

WORDS = config.words.low..config.words.high # per sentence
SENTENCES = config.sentences.low..config.sentences.high
PARAGRAPHS = config.paragraphs.low..config.paragraphs.high

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
