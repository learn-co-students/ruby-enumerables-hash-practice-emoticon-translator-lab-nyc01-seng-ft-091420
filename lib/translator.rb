# require modules here
require "yaml"

def load_library(file_path)
  dict = YAML.load_file(file_path)
  dict.each_with_object({}) do |dict, hash|
    word = dict[0]
    english = dict[1][0]
    japanese = dict[1][1]
    hash[word] = { :english => english, :japanese => japanese }
  end
end

def get_japanese_emoticon(file_path, emoticon)
  dict = load_library(file_path)
  japanese_result = nil
  dict.find do |key, value|
    if dict[key][:english] == emoticon
      japanese_result = dict[key][:japanese]
    end
  end
  
  if !japanese_result
    "Sorry, that emoticon was not found"
  else
    japanese_result
  end
end

def get_english_meaning(file_path, emoticon)
  dict = load_library(file_path)
  english_result = nil
  dict.find do |key, value|
    if dict[key][:japanese] == emoticon
      english_result = key
    end
  end
  
  if !english_result
    "Sorry, that emoticon was not found"
  else
    english_result
  end
end