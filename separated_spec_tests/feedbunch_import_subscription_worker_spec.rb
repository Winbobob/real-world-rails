require 'rails_helper'

describe ImportSubscriptionWorker do

  before :each do
    @user = FactoryBot.create :user
    @opml_import_job_state = FactoryBot.build :opml_import_job_state, user_id: @user.id, state: OpmlImportJobState::RUNNING,
                                     total_feeds: 10, processed_feeds: 0
    @user.opml_import_job_state = @opml_import_job_state

    @url = 'http://some.feed.com/'
    @feed = FactoryBot.create :feed, fetch_url: @url

    @folder = FactoryBot.build :folder, user_id: @user.id
    @user.folders << @folder
  end

  context 'validations' do

    it 'does nothing if the job state does not exist' 


    it 'does nothing if the opml_import_job_state has state NONE' 


    it 'does nothing if the opml_import_job_state has state ERROR' 


    it 'does nothing if the opml_import_job_state has state SUCCESS' 


    it 'ignores folder if it does not exist' 


    it 'ignores folder if it is owned by a different user' 


  end

  context 'total processed feeds count' do

    it 'increments count when finishes successfully' 


    it 'increments count when finishes with an error' 


    it 'does not increment count if opml_import_job_state has state NONE' 


    it 'does not increment count if opml_import_job_state has state ERROR' 


    it 'does not increment count if opml_import_job_state has state SUCCESS' 


    it 'does not increment count if it is already at the total number of feeds' 


  end

  context 'finishes successfully' do

    it 'subscribes user to feed' 


    it 'puts subscribed feed in passed folder' 

  end

  context 'failed URLs during import' do

    it 'creates OpmlImportFailure instance if an error is raised' 

  end

  context 'blacklisted URL' do

    before :each do
      @blacklisted_url = 'some.aede.bastard.com'
      @blacklisted_host = Addressable::URI.parse("http://#{@blacklisted_url}").host
      Rails.application.config.hosts_blacklist = [@blacklisted_host]
    end

    it 'does not subscribe user to blacklisted URL' 


    it 'creates OpmlImportFailure instance if an error is raised' 

  end

end

