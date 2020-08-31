require 'pry'
require "yaml"


def load_library(file)
  new_file = YAML.load_file(file)
    new_file.each_with_object({}) do |(key, value), translator_hash|
      translator_hash[key] = {english: value[0], japanese: value[1]}
  end
end

def get_japanese_emoticon(file, emoticon)
    library = load_library(file)
    library.each do |emotion, emoticons|
    result = emoticons[:english]
    if result == emoticon
      return emoticons[:japanese]
      end
    end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(file, emoticon)
  library = load_library(file)
  library.each do |emotion, emoticons|
  result = emoticons[:japanese]
  if result == emoticon
  return emotion
      end
    end
  return "Sorry, that emoticon was not found"
end
