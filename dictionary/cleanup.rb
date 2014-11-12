#!/usr/bin/env ruby

def clean_dictionary(dictionary=nil)
  dictionary ||= "dictionary/dictionary.txt"
  
  text = File.read(dictionary)
  text.gsub(/\d+/, "").squeeze(" ").strip
  cleanup = text.downcase

end

randnum  = rand(1000..9999)
filename = "dictionary/dictionary-#{randnum}.txt"
File.open(filename, "w+") {|f| f.puts clean_dictionary(ARGV[0])}