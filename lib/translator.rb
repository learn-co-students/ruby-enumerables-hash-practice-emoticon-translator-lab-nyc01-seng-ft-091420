# require modules here
require "yaml"
require 'pry'

#binding.pry

def load_library(emoticons)
  emoticons = YAML.load_file('lib/emoticons.yml')
  #binding.pry
  array_of_hashes = []
  array_of_keys = [:english, :japanese]
  keys = []
  new_hash = {}
  emoticons.each do |key, value|
    
    keys << key
    array_of_hashes << array_of_keys.zip(value).to_h
    
  end
  
  keys.zip(array_of_hashes).each do |key, hash|
    new_hash[key] = hash
    
  end
      
  emoticons = new_hash
  
  # binding.pry
  # count = 0
  # emoticons.each do |key, value|
  #   while count < array_of_hashes.length do
  #     value = array_of_hashes[count]
  #     count += 1
  #   end
  # end
  
  #binding.pry
  
  # emoticons.each do |emotion|
  #   emotion[0] = :japanese => emotion[0]
  #   emotion[1] = :english => emotion[1]
  # end
  # binding.pry
  # emoticons
end

def get_japanese_emoticon(emoticons, input)
  # code goes here
  emote = load_library(emoticons)
  japanese = nil
  count = 0
  emote.each do |key, value|
    #binding.pry
    if emote[key][:english] == input
      japanese = emote[key][:japanese]
      #binding.pry
      return japanese
    end
    if !emote[key].has_value?(input)
      count += 1
    end
  end
  if count == emote.length
    p "Sorry, that emoticon was not found"
  end
  
  
  # emote.each do |key, value|
  #   while count < emote.length do
  #     if !emote[key][:english] == input
  #       count += 1
  #       #binding.pry
  #     end
  #   end
  # end
  # #binding.pry
  # if count = emote.length
  #   puts "Sorry, that emoticon was not found"
  # end
  # count = 0
  # inner_count = 0
  # while count < emote.length do
  #   elsif !emote[key].include? input
  #     puts "Sorry, that emoticon was not found"
  #binding.pry
end

#binding.pry
def get_english_meaning(emoticons,input)
  # code goes here
  count = 0
  emote = load_library(emoticons)
  #binding.pry
  emote.each do |key, value|
    #binding.pry
    if emote[key][:japanese] == input
      return key
      #binding.pry
    end
    if !emote[key].has_value?(input)
      count += 1
    end
  end
  if count == emote.length
    p "Sorry, that emoticon was not found"
  end
  
  #english_meaning
end

