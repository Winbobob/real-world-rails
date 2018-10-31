require 'rails_helper'

RSpec.describe GdprExportsController, type: :controller do
  include ActiveJob::TestHelper
  render_views

  let(:participant) { create :participant }

  context 'unauthenticated' do
    it "asks to sign in" 

  end

  context 'authenticated' do
    before do
      sign_in participant
    end
    it "queues the job" 

  end

end

