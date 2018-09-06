require 'spec_helper'
require 'open_food_network/i18n_config'

module OpenFoodNetwork
  describe I18nConfig do
    context "in default test configuration" do
      before do
        allow(ENV).to receive(:[]).with("LOCALE").and_return("en")
        allow(ENV).to receive(:[]).with("AVAILABLE_LOCALES").and_return("en,es")
      end

      it "provides the source locale" 


      it "provides the default locale" 


      it "provides the default selectable locales" 


      it "provides the default available locales" 

    end

    context "without configuration" do
      before do
        allow(ENV).to receive(:[]).with("LOCALE").and_return(nil)
        allow(ENV).to receive(:[]).with("I18N_LOCALE").and_return(nil)
        allow(ENV).to receive(:[]).with("AVAILABLE_LOCALES").and_return(nil)
      end

      it "provides the source locale" 


      it "provides the default locale" 


      it "provides the default selectable locales" 


      it "provides the default available locales" 

    end

    context "with UK configuration" do
      before do
        allow(ENV).to receive(:[]).with("LOCALE").and_return("en_GB")
        allow(ENV).to receive(:[]).with("I18N_LOCALE").and_return(nil)
        allow(ENV).to receive(:[]).with("AVAILABLE_LOCALES").and_return("en_GB")
      end

      it "provides the source locale" 


      it "provides the default locale" 


      it "provides the default selectable locales" 


      it "provides the default available locales" 

    end

    context "with human syntax" do
      before do
        allow(ENV).to receive(:[]).with("LOCALE").and_return("es")
        allow(ENV).to receive(:[]).with("AVAILABLE_LOCALES").and_return("es, fr ,, ,de")
      end

      it "provides the default selectable locales" 


      it "provides the default available locales" 

    end
  end
end

