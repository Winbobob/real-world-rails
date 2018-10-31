require 'rails_helper'

describe "AccountCreationAnalytics" do

  let(:analytics) { AccountCreationAnalytics.new }
  let(:segment_analytics) { SegmentAnalytics.new }
  let(:track_calls) { segment_analytics.backend.track_calls }
  let(:identify_calls) { segment_analytics.backend.identify_calls }

  context 'tracking teacher account creation' do
    let(:teacher) { create(:teacher) }

    def subject
      analytics.track_teacher(teacher)
    end

    it 'identifies the new user and send an event' 


    it 'sends an account creation event' 


    def sign_up_for_newsletter(user)
      user.update_attributes(send_newsletter: true)
    end

    context 'teacher signed up for newsletter' do
      it 'sends a signed up for newsletter event' 

    end

    context 'teacher did not sign up for newsletter' do
      it 'doesnt send a signed up for newsletter event' 

    end

  end

  context 'tracking student creating her own account' do
    let(:student) { create(:student) }

    it 'identifies the new user and send an event' 


    it 'sends an event' 


  end

end

