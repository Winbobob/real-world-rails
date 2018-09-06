# frozen_string_literal: true

require "rails_helper"

RSpec.describe LastActiveJob, type: :job do
  let(:user) { create(:user) }

  before(:each) do
    Timecop.freeze(Time.zone.now)
    @time = (Time.zone.now + 600).to_i
  end

  after(:each) do
    Timecop.return
  end

  it "uses the :last_active_at queue" 


  it "updates the last_active_at attribute" 


  it "does not change the updated_at column" 


  it "does not raise an error if the user is not longer present" 

end

