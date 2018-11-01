require 'rails_helper'

RSpec.describe CreateAudioFeatureJob, type: :job do
  include ActiveJob::TestHelper

  fixtures :assets

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  subject(:job) { described_class.perform_later(assets(:valid_arthur_mp3).id) }

  it "queues the job" 

end

