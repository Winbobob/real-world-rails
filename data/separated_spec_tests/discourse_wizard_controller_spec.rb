require 'rails_helper'

describe WizardController do

  context 'wizard enabled' do
    render_views

    before do
      SiteSetting.wizard_enabled = true
    end

    it 'needs you to be logged in' 


    it 'needs you to be logged in' 


    it "raises an error if you aren't an admin" 


    it "raises an error if the wizard is disabled" 


    it "renders the wizard if you are an admin" 


    it "returns JSON when the mime type is appropriate" 

  end

end

