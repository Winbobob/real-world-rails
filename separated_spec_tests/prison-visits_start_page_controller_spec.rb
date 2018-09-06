require 'rails_helper'

RSpec.describe StartPageController, type: :controller do
  describe 'show' do
    before :each do
      Rails.configuration.new_app_probability = 0.2
    end

    after :each do
      Rails.configuration.new_app_probability = 0
    end

    it 'stores a random threshold in the user\'s session' 


    it "redirects to the new app if the user's threshold is low" 


    it "redirects to this (old) app if the user's threshold is high" 

  end
end

