require "rails_helper"

RSpec.describe EmailDigestMailer, type: :mailer do
  let(:challenge) { create :challenge }
  let(:other_participant) { create :participant, :every_email }
  let(:comment) { create :comment, participant: other_participant }
  let(:submission) { create :submission, challenge: challenge }

  context 'methods' do
    before do
      Timecop.freeze(Time.now)
    end

    after do
      Timecop.return
    end

    describe '#set_start_dttm' do
      it 'daily' 

      it 'weekly' 

    end

    describe '#build_subject' do
      it 'daily' 


      it 'weekly' 

    end

    describe '#build_body' do
      let!(:participant) { create :participant, :daily }
      before do
        @submissions = Submission.all
        @comments = Comment.all
      end
      it 'daily' 

      it 'weekly' 

    end

    describe '#body_header' do
      it 'daily' 

      it 'weekly' 

    end

    describe '#comments' do
    end

    describe '#submissions' do
    end

    describe '#render_comments' do
    end

    describe '#render_submissions' do
    end
  end


end

