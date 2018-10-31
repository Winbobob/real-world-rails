require 'rails_helper'
RSpec.describe Admin::OrganizerApplicationNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:organizer_application) { create :organizer_application }
  let!(:admin) { create :participant, :admin }

  before do
    admin.email_preferences.first.update(email_frequency: :every)
  end
  
  subject(:job) { described_class.perform_later(organizer_application) }

  describe 'queues the job' do
    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end
  end

end

