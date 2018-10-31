require 'rails_helper'

describe SiteSettingsTask do

  before do
    Discourse::Application.load_tasks
  end

  describe 'export' do
    it 'creates a hash of all site settings' 

  end

  describe 'import' do
    it 'updates site settings' 


    it "won't update a setting that doesn't exist" 


    it "will log that an error has occured" 

  end
end

