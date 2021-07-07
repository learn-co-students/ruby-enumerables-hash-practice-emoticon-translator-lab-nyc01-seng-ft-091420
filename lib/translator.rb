# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  new_emoticons = {}
  emoticons = YAML.load_file(path)
  emoticons.each do |emotion, emoticons|
    new_emoticons[emotion] = {}
    new_emoticons[emotion][:english] = emoticons[0]
    new_emoticons[emotion][:japanese] = emoticons[1]
  end
  return new_emoticons
end

def get_japanese_emoticon(path,eng_emoticon)
  # code goes here
  dictionary = load_library(path)
  answer = "Sorry, that emoticon was not found"
  dictionary.each do |emotion,emoticons|
    if eng_emoticon == dictionary[emotion][:english]
      answer = dictionary[emotion][:japanese]
    end
  end
  return answer
end

def get_english_meaning(path,jp_emoticon)
  # code goes here
  dictionary = load_library(path)
  answer = "Sorry, that emoticon was not found"
  dictionary.each do |emotion,emoticons|
    if jp_emoticon == dictionary[emotion][:japanese]
      answer = emotion
    end
  end
  return answer
end