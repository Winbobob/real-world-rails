require 'rails_helper'

describe VersionsMailer, type: :mailer do
  describe 'new_version' do
    let(:user) { create(:user) }
    let(:version) { create(:version) }
    let(:mail) { VersionsMailer.new_version(user, version.project, version) }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'uses nickname' 

  end
end

