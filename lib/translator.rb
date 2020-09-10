# require modules here

require "yaml"

def load_library(yml_path)
emoticons = YAML.load_file(yml_path)
new_hash = {}

emoticons.each do |key, value|
  new_hash[key] = {}
  new_hash[key][:english] = value[0]
  new_hash[key][:japanese] = value[1]
  end
  new_hash
end



def get_english_meaning(yml_path, emoticon)
  library = load_library(yml_path)
    emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end

#   if emoticon == new_hash[:japanese]
#   # code goes here
#hash.key(value) => key

#ok load_library producdes a hash (new_hash) with key/value pairs. 
#key is a string (happy), containing a inner_hash (language->symbol).
# the inner_hash is language(key)->emoticon(value). there are two pairs in the inner_hash.
#so i need to find what inner_hash key the value of emoticon is equal to, 
#and return the other paired value 

def get_japanese_emoticon(yml_path, emoticon)
  library = load_library(yml_path)
 emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end
