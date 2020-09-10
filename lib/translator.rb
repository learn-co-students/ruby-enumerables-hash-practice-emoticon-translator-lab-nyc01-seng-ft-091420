require 'yaml'
require 'pry'

def load_library(path)
  final_hash = {}
  YAML.load_file(path).each do |key, value|
    final_hash[key] = {}
    final_hash[key][:english] = value [0]
    final_hash[key][:japanese] = value[1]
  end
  final_hash
end


def get_english_meaning(path, emoticon)
   load_library(path).each do |key, value|
    if value [:japanese] == emoticon 
      return key 
    end
  end 
  return "Sorry, that emoticon was not found"
  end

def get_japanese_emoticon(path, emoticon)
load_library(path).each do |key, value|
    if value[:english] == emoticon 
      return value[:japanese]
    end 
end
return "Sorry, that emoticon was not found"
end








# require 'yaml'
# require 'pry'



# def get_japanese_emoticon(emoticon_file, emoticon)
#   emoticon_lib = load_library(emoticon_file)
#   japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
#   if japanese_emoticon == nil 
#     japanese_emoticon = "Sorry, that emoticon was not found"
#   end
#   japanese_emoticon 
# end 


# def get_english_meaning(emoticon_file, emoticon)
#   emoticon_lib = load_library(emoticon_file)
#   english_meaning = emoticon_lib['get_meaning'][emoticon]
#   if english_meaning == nil 
#     english_meaning = "Sorry, that emoticon was not found"
#   end 
#   english_meaning 
# end 

  
  
  
  
  

