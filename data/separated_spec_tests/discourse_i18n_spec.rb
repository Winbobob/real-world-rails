require "rails_helper"
require "i18n/duplicate_key_finder"

def extract_locale(path)
  path[/\.([^.]{2,})\.yml$/, 1]
end

PLURALIZATION_KEYS ||= ['zero', 'one', 'two', 'few', 'many', 'other']

def find_pluralizations(hash, parent_key = '', pluralizations = Hash.new)
  hash.each do |key, value|
    if Hash === value
      current_key = parent_key.blank? ? key : "#{parent_key}.#{key}"
      find_pluralizations(value, current_key, pluralizations)
    elsif PLURALIZATION_KEYS.include? key
      pluralizations[parent_key] = hash
    end
  end

  pluralizations
end

def is_yaml_compatible?(english, translated)
  english.each do |k, v|
    if translated.has_key?(k)
      if Hash === v
        if Hash === translated[k]
          return false unless is_yaml_compatible?(v, translated[k])
        end
      else
        return false unless v.class == translated[k].class
      end
    end
  end

  true
end

describe "i18n integrity checks" do

  it 'has an i18n key for each Trust Levels' 


  it "has an i18n key for each Site Setting" 


  it "has an i18n key for each Badge description" 


  Dir["#{Rails.root}/config/locales/{client,server}.*.yml"].each do |path|
    it "does not contain invalid interpolation keys for '#{path}'" 

  end

  Dir["#{Rails.root}/config/locales/client.*.yml"].each do |path|
    it "has valid client YAML for '#{path}'" 

  end

  Dir["#{Rails.root}/**/locale*/*.en.yml"].each do |english_path|
    english_yaml = YAML.load_file(english_path)["en"]

    context(english_path) do
      it "has no duplicate keys" 


      find_pluralizations(english_yaml).each do |key, hash|
        next if key["messages.restrict_dependent_destroy"]

        it "has valid pluralizations for '#{key}'" 

      end
    end

    Dir[english_path.sub(".en.yml", ".*.yml")].each do |path|
      next if path[".en.yml"]

      context(path) do
        locale = extract_locale(path)
        yaml = YAML.load_file(path)

        it "has no duplicate keys" 


        it "does not overwrite another locale" 


        unless path["transliterate"]

          it "is compatible with english" 


        end

      end

    end
  end

end

