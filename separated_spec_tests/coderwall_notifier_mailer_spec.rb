RSpec.describe NotifierMailer, type: :mailer do
  let(:user) { user = Fabricate(:user, email: 'some.user@example.com') }

  it 'should send welcome email to user' 


  it 'should record when welcome email was sent' 


  it 'should send an email when a user receives an endorsement' 


  it 'should send an email when a user receives an endorsement and achievement' 


  describe 'achievement emails' do

    it 'should send an email when a user receives a new achievement' 


    it 'should send one achievement email at a time until user visits' 


    def check_badge_message(email, badge)
      if badge.tokenized_skill_name.blank?
        expect(email.body.encoded).to include("You've earned a new badge for #{badge.for}")
      else
        expect(email.body.encoded).to include("You've earned a new badge for your #{badge.tokenized_skill_name} hacking skills and contribution.")
      end
    end
  end

  describe 'comment emails' do
    let(:protip) { Fabricate(:protip, user: user) }
    let(:commentor) { Fabricate(:user) }

    it 'should send an email when a user receives a comment on their protip' 


    it 'should send an email when a user is mentioned in a comment' 

  end
end

