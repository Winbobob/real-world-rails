require "rails_helper"

RSpec.describe "Internal Events", type: :request do
  let(:event) { create(:event) }
  let(:admin) { create(:user, :super_admin) }

  describe "PUT internal/events" do
    before do
      login_as(admin)
    end

    it "marks an event as not live now" 


    it "marks an event as live now" 

  end
end

