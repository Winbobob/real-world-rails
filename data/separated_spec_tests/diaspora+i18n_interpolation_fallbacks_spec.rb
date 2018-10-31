# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe "i18n interpolation fallbacks" do
  describe "when string does not require interpolation arguments" do
    it "works normally" 

  end
  describe "when string requires interpolation arguments" do
    context "current locale has no fallbacks" do
      # tags.show.follow: "Follow #%{tag}" (in en.yml)
      it "returns the translation when all arguments are provided" 

      it "returns the translation without substitution when all arguments are omitted" 

      it "raises a MissingInterpolationArgument when arguments are wrong" 

    end
    context "current locale falls back to English" do
      before do
        @old_locale = I18n.locale
        I18n.locale = 'it'
        I18n.backend.store_translations('it', {"nonexistant_key" => "%{random_key} here is some Italian"})
      end
      after do
        I18n.locale = @old_locale
      end
      describe "when all arguments are provided" do
        it "returns the locale's translation" 

      end
      describe "when no arguments are provided" do
        it "returns the locale's translation without substitution" 

      end
      describe "when arguments are wrong" do
        describe "when the English translation works" do
          it "falls back to English" 

        end
        describe "when the English translation does not work" do
          it "raises a MissingInterpolationArgument" 

        end
      end
    end
  end
end

