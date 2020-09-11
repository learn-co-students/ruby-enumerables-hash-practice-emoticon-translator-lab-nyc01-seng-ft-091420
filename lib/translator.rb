require "yaml"# require modules here

def load_library(file_path)
  emoticons = YAML.load_file(file_path).map { |emotion, symbol| [emotion, [[:english, symbol[0]]].to_h] }.to_h
  YAML.load_file(file_path).map { |emotion, symbol| emoticons[emotion][:japanese] = symbol[1] }
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  if translation = load_library(file_path).find {|key, value| value[:english] == emoticon }
    translation[1][:japanese]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  if translation = load_library(file_path).find {|key, value| value[:japanese] == emoticon }
    translation[0]
  else
    "Sorry, that emoticon was not found"
  end
end
