# require modules here
require 'yaml'

def load_library(path)
  # code goes here
  new_emoticons = {}
  emoticons = YAML.load_file(path)
  emoticons.each { |expression, emoticons|
    new_emoticons[expression] = {}
    new_emoticons[expression][:english] = emoticons[0]
    new_emoticons[expression][:japanese] = emoticons[1]
  }
  return new_emoticons
end

def get_japanese_emoticon(path, eng_emoticon)
  # code goes here
  dictionary = load_library(path)
  answer = "Sorry, that emoticon was not found"
  dictionary.each { |expression,emoticons|
    if eng_emoticon == dictionary[expression][:english]
      answer = dictionary[expression][:japanese]
    end
  }
  return answer
end

def get_english_meaning(path, jp_emoticon)
  # code goes here
  dictionary = load_library(path)
  answer = "Sorry, that emoticon was not found"
  dictionary.each { |expression,emoticons|
    if jp_emoticon == dictionary[expression][:japanese]
      answer = expression
    end
  }
  return answer
end