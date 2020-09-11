# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  hash = {}
  lib = YAML.load_file(file_path)
  lib.each { | meaning, versions |
    hash[meaning] = {
      :english => versions[0],
      :japanese => versions[1]
    }
  }
  hash
end

def get_japanese_emoticon(file_path, input)
  # code goes here
  lib = load_library(file_path)
  lib.each { |meaning, emoticons|
    return emoticons[:japanese] if emoticons[:english] == input
  }
  p "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, input)
  # code goes here
  lib = load_library(file_path)
  lib.each { |meaning, emoticons|
    return meaning if emoticons[:japanese] == input
  }
  p "Sorry, that emoticon was not found"
end
