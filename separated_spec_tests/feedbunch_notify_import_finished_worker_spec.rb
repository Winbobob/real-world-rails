require 'rails_helper'

describe NotifyImportFinishedWorker do

  before :each do
    @user = FactoryBot.create :user
    @opml_import_job_state = FactoryBot.build :opml_import_job_state, user_id: @user.id, state: OpmlImportJobState::RUNNING,
                                     total_feeds: 4, processed_feeds: 4
    @user.opml_import_job_state = @opml_import_job_state

    # Remove emails still in the mail queue
    ActionMailer::Base.deliveries.clear
  end

  context 'validations' do

    it 'does nothing if the job state does not exist' 


    it 'does nothing if the opml_import_job_state has state NONE' 


    it 'does nothing if the opml_import_job_state has state ERROR' 


    it 'does nothing if the opml_import_job_state has state SUCCESS' 

  end

  context 'finishes successfully' do

    it 'sets data import state to SUCCESS' 


    it 'sends a notification email' 


    it 'sends a notification email with failed feeds' 


  end

  context 'finishes with an error' do

    before :each do
      allow(OPMLImportNotifier).to receive(:notify_success).and_raise StandardError.new
    end

    it 'sets data import state to ERROR if an error is raised' 


    it 'sends an email' 


  end

end

