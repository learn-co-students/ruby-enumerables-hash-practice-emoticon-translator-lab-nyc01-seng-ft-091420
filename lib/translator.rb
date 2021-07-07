require 'pry'
require "yaml"
def load_library(path)
  emoticons = YAML.load_file(path)
  emoticons.each do |names,signs|
    emoticons[names]={:english=>signs[0], :japanese=>signs[1]}
  end
end
#binding.pry
def get_japanese_emoticon(path, english_emoticon)
  japface=nil
  signs=load_library(path)
  signs.each_value do |emo|
      if english_emoticon==emo[:english]
        japface=emo[:japanese]
      end
  end
     if japface==nil
       japface="Sorry, that emoticon was not found"
     end
      japface
end


def get_english_meaning(path, japanese_emoticon)
  signs=load_library(path)
  english_meaning= nil
  signs.each do |name, emo|
      if japanese_emoticon==emo[:japanese]
        english_meaning=name
      end
  end
     if english_meaning == nil
       english_meaning="Sorry, that emoticon was not found"
     end
      english_meaning
end
