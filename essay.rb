#!/usr/bin/env ruby

require 'marky_markov'

DICTIONARY = "dictionary/dictionary.txt"
WORDS = 15..30 # per sentence
SENTENCES = 8..15 # per paragraph
PARAGRAPHS = 5..7 # per essay

def sentence_generate(number)
  essay = MarkyMarkov::TemporaryDictionary.new(4)
  essay.parse_file DICTIONARY
  essay.generate_n_words number
end

def paragraph_generate(sentences=1)
  rand = rand(WORDS)
  sentences.times.map { |x| sentence_generate(rand).capitalize }
end

def essay_generate
  rand = rand(SENTENCES)
  words = paragraph_generate(rand)
  string = words.join(". ")
  string.capitalize
end
    
randnum = rand(10000000..99999999)
final = File.new("essays/essay-#{randnum}.txt", "w+")
essay = rand(PARAGRAPHS).times.map { essay_generate + ".\n\n" }
final.puts essay
final.close
puts "Output: Essay-#{randnum}.txt"