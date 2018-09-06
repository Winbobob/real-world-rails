require 'rails_helper'

describe ImportOpmlWorker do

  before :each do
    # Ensure files are not deleted, we will need them for running tests again!
    allow(File).to receive(:delete).and_return 1

    @user = FactoryBot.create :user
    @opml_import_job_state = FactoryBot.build :opml_import_job_state, user_id: @user.id, state: OpmlImportJobState::RUNNING,
                                     total_feeds: 0, processed_feeds: 0
    @user.opml_import_job_state = @opml_import_job_state

    @filename = '1371324422.opml'
    @filepath = File.join __dir__, '..', '..', 'attachments', @filename
    @file_contents = File.read @filepath

    allow(Feedbunch::Application.config.uploads_manager).to receive :read do |user_id, folder, filename|
      expect(user_id).to eq @user.id
      if filename == @filename
        @file_contents
      else
        nil
      end
    end
    allow(Feedbunch::Application.config.uploads_manager).to receive :save
    allow(Feedbunch::Application.config.uploads_manager).to receive :delete

    allow(ImportSubscriptionsWorker).to receive :perform_async
  end

  context 'validations' do

    it 'sets data import state to ERROR if the file does not exist' 


    it 'sets data import state to ERROR if the file is not well formed XML' 


    it 'sets data import state to ERROR if the file is not valid OPML' 


    it 'does nothing if the user does not exist' 


    it 'does nothing if the user does not have a opml_import_job_state' 


    it 'does nothing if the opml_import_job_state for the user has state NONE' 


    it 'does nothing if the opml_import_job_state for the user has state ERROR' 


    it 'does nothing if the opml_import_job_state for the user has state SUCCESS' 

  end

  context 'OPML file management' do

    it 'reads uploaded file' 


    it 'deletes file after finishing successfully' 


    it 'deletes file after finishing with an error' 

  end

  context 'finishes successfully' do

    it 'updates the data import total number of feeds' 


    it 'creates folders in OPML' 


    it 'enqueues superworker' 

  end

  context 'finishes with an error' do

    before :each do
      allow(ImportSubscriptionsWorker).to receive(:perform_async).and_raise StandardError.new
    end

    it 'sets data import state to ERROR' 


    it 'sends notification email' 

  end

  context 'folder structure' do

    it 'creates folders from google-style opml (with folder title)' 


    it 'creates folders from TinyTinyRSS-style opml (without folder title)' 


    it 'reuses folders already created by the user' 

  end

end

