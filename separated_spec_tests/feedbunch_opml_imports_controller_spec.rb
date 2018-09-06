require 'rails_helper'

describe Api::OpmlImportsController, type: :controller do

  before :each do
    @user = FactoryBot.create :user

    login_user_for_unit @user
  end

  context 'GET show' do

    it 'returns import process state successfully' 


    it 'assigns the correct opml_import_job_state' 


  end

  context 'POST create' do

    before :each do
      allow_any_instance_of(String).to receive :tempfile
    end

    it 'redirects to main application page if successful' 


    it 'redirects to main application page if an error happens' 


    it 'creates a OpmlImportJobState instance with ERROR state if an error happens' 

  end

  context 'PUT update' do

    it 'asigns the correct OpmlImportJobState' 


    it 'returns success' 


    it 'returns 500 if there is a problem changing the alert visibility' 

  end

end

