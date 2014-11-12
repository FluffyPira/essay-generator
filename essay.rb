#!/usr/bin/env ruby

require 'marky_markov'

DICTIONARY = "dictionary/dictionary.txt"
WORDS = 15..30 # per sentence
SENTENCES = 8..15 # per paragraph
PARAGRAPHS = 5..7 # per essay

module EssayMaker

  class Essay
  
    def initialize
      @essay = MarkyMarkov::TemporaryDictionary.new(4)
      @essay.parse_file DICTIONARY
    end
    
    def word_generate(number)
      @essay.generate_n_words number
    end

    def sentence_generate(sentences=1)
      words = rand(WORDS)
      sentences.times.map { |x| word_generate(words).capitalize }
    end

    def paragraph_generate
      sentences = rand(SENTENCES)
      words = sentence_generate(sentences)
      string = words.join(". ")
      string.capitalize
    end
  
    def generate
      rand(PARAGRAPHS).times.map { paragraph_generate + ".\n\n" }
    end
    
  end

end

randnum  = rand(10000000..99999999)
filename = "essays/essay-#{randnum}.txt"

File.open(filename, "w+") {|f| f.puts EssayMaker::Essay.new.generate}

puts "Output: #{filename}"