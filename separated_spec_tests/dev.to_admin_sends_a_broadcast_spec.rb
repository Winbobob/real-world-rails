# rubocop:disable RSpec/InstanceVariable
require "rails_helper"

describe "Send a broadcast" do
  describe "Onboarding/welcome broadcast" do
    describe "sent broadcast" do
      before do
        @broadcast = FactoryBot.create(:broadcast, :onboarding, :sent)
        @new_user = FactoryBot.create(:user)
        @welcome_notification = Broadcast.send_welcome_notification(@new_user.id)
      end

      it "has a welcome notification" 


      it "is properly sent to the new user" 


      it "has a link to the welcome thread" 

    end

    describe "unsent broadcast" do
      before do
        FactoryBot.create(:broadcast, :onboarding)
      end

      it "is an unsent broadcast that doesn't create a notification" 

    end
  end
end
# rubocop:enable RSpec/InstanceVariable

