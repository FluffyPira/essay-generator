#!/usr/bin/env ruby

DICTIONARY = "dictionary.txt"

text = File.read(DICTIONARY)
text.gsub(/\d+/, "").squeeze(" ").strip
cleanup = text.downcase

randnum = rand(1..9000)
final = File.new("dictionary-#{randnum}.txt", "w+")
final.puts cleanup
final.close