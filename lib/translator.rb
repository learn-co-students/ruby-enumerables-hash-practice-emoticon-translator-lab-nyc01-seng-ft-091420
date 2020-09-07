# require modules here
require "yaml"
def load_library(path)
  # code goes here
  yaml = YAML.load_file(path)
  emoticons = {}
  yaml.each { |key, value|
    emoticons[key] = { english: value[0], japanese: value[1] }
  }
  emoticons

end


def get_japanese_emoticon(path, emoticon)
  # code goes here
  emoticons = load_library(path)
  emoticons.each { |key, value|
    value.each { |nKey, nValue|
      if(nValue == emoticon)
        return emoticons[key][:japanese]
      end
      }
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  emoticons.each { |key, value|
      value.each { | nKey, nValue|
        if(nValue == emoticon)
          return key
        end
      }
  }
  return "Sorry, that emoticon was not found"
end
