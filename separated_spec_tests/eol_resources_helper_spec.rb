require "spec_helper"

describe ResourcesHelper do

  describe '#frequency' do

    before(:all) do
      Language.create_english
      I18n.locale = Language.english.iso_code
    end

    it 'says "once" when 0' 


    it 'says "weekly" when 7 * 24' 


    it 'says "monthly" when 30 * 24' 


    it 'says "bi-monthly" when 60 * 24' 


    it 'says "quarterly" when 91 * 24' 


    it 'counts the hours when weird values' 


  end

end

