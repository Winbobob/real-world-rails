require 'spec_helper'

feature 'External services' do
  include AuthenticationWorkflow

  describe "bugherd" do
    before do
      Spree::Config.bugherd_api_key = nil
      login_to_admin_section
    end

    it "lets me set an API key" 

  end
end

