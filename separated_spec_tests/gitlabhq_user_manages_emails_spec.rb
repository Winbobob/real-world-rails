require 'spec_helper'

describe 'User manages emails' do
  let(:user) { create(:user) }

  before do
    sign_in(user)

    visit(profile_emails_path)
  end

  it "shows user's emails" 


  it 'adds an email' 


  it 'does not add a duplicate email' 


  it 'removes an email' 

end

