require "rails_helper"

describe VersionMailer do
  subject { VersionMailer.send_notice }

  context 'contact_email is blank' do
    before { SiteSetting.contact_email = '' }

    it "doesn't send the email" 

  end

  context 'contact_email is set' do
    before { SiteSetting.contact_email = 'me@example.com' }

    it "works" 


  end
end

