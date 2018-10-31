require "rails_helper"

describe "scheduled_pickups/show" do
  it "displays the Scheduled Pickup" 


  let(:now) { Date.new(2016, 4, 5).beginning_of_day }

  before do
    view.signed_in = true
  end

  around do |example|
    Timecop.freeze(now) { example.run }
  end
end

