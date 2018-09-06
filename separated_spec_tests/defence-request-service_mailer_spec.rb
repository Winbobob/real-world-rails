require "rails_helper"

RSpec.describe Mailer, type: :mailer do
  subject { Mailer }
  let(:defence_request) { FactoryGirl.create(:defence_request, interview_start_time: DateTime.parse("13-04-1992 9:50")) }
  let(:solicitor) { FactoryGirl.create(:solicitor_user) }

  describe "notify_interview_start_change" do
    before do
      @response = subject.notify_interview_start_change(defence_request, solicitor).deliver_now
    end

    it "contains a link to the request" 


    it "contains the new start time" 

  end
end

