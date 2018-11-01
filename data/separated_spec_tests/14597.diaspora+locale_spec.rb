# frozen_string_literal: true

describe 'locale files' do
  describe "cldr/plurals.rb" do
    AVAILABLE_LANGUAGE_CODES.each do |locale|
      describe "#{locale} plural rules" do
        it "defines the keys for #{locale}" 


        it "defines a valid pluralization function for #{locale}" 


        it "defines a valid javascript pluralization function for #{locale}" 

      end
    end
  end

  AVAILABLE_LANGUAGE_CODES.each do |locale|
    ["diaspora/#{locale}.yml",
     "devise/devise.#{locale}.yml",
     "javascript/javascript.#{locale}.yml"].each do |file|
      describe file do
        it "has no syntax errors if it exists" 

      end
    end
  end
end

