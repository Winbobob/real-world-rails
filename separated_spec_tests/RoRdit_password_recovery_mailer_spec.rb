RSpec.describe PasswordRecoveryMailer, :type => :mailer do
  describe '#password_recovery' do
    before do
      SmtpSetting.create(user_name: "steve", password: "jobs", domain: "apple.com", address: "smtp.apple.com", port: 587,
                         authentication: "login", default_from: "Steve Jobs <steve@apple.com>")
    end

    let(:user) { create(:user) }
    let(:mail) { user.send_password_reset_token }

    it 'checks mail data' 

  end
end

