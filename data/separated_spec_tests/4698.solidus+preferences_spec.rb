# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::TestingSupport::Preferences do
  describe 'resetting the app configuration' do
    before do
      @original_spree_mails_from = Spree::Config.mails_from
      @original_spree_searcher_class = Spree::Config.searcher_class
      class MySearcherClass; end
      include Spree::TestingSupport::Preferences
      Spree::Config.mails_from = "hello@myserver.com"
      Spree::Config.searcher_class = MySearcherClass
    end

    it 'resets normal preferences' 


    it 'resets cached configuration instance variables' 

  end
end

