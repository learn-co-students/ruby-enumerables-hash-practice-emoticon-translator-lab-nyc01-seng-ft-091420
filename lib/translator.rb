require "pry"
require "yaml"

def load_library(file)
  library = YAML.load_file(file)
  final = library.each_with_object({}) do |(key, value), entry|
    entry[key] = {english: value[0], japanese: value[1]}
  end
  final
end


def get_japanese_emoticon(file, string)
  i = 0
  emojis = load_library(file)
  values = emojis.values
  x = values.find {|i| i[:english] == string}
  while i < values.length do 
    if values[i] == x 
      return values[i][:japanese].to_s
    end
    i += 1
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(file, string)
  i = 0
  emojis = load_library(file)
  keys = emojis.keys
  values = emojis.values
  x = values.find {|i| i[:japanese] == string}
  while i < values.length do
    if values[i] == x
      return keys[i].to_s
    end
    i += 1
  end
  return "Sorry, that emoticon was not found"
end