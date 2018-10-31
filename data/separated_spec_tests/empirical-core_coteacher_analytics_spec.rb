require 'rails_helper'

describe 'CoteacherAnalytics' do
  let(:analytics) { CoteacherAnalytics.new }
  let(:segment_analytics) { SegmentAnalytics.new }
  let(:track_calls) { segment_analytics.backend.track_calls }
  let(:identify_calls) { segment_analytics.backend.identify_calls }
  let(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }

  context 'when sending a new coteacher invitation' do
    let(:invitee_email) { Faker::Internet.safe_email }

    before(:each) do
      analytics.track_coteacher_invitation(teacher, invitee_email)
    end

    it 'identifies the teacher' 


    it 'sends the event' 

  end

  context 'when transferring a classroom' do
    let(:other_teacher) { create(:teacher) }

    before(:each) do
      analytics.track_transfer_classroom(teacher, other_teacher.id)
    end

    it 'identifies the teacher' 


    it 'sends the event' 

  end
end

