require "yaml"
require 'pry'
def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}

  emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end

  new_hash

end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
# binding.pry
if library[emoticon] == nil 
  return "Sorry, that emoticon was not found"
end
library[emoticon][:japanese]
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
 
 emoticon ? emoticon : "Sorry, that emoticon was not found"
  
end



