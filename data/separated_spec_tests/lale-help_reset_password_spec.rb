require 'rails_helper'

describe TokenHandlers::ResetPassword do
  subject { TokenHandlers::ResetPassword }
  let(:volunteer)      { create(:volunteer)  }
  let(:token)          { create(:token, :reset_password, user: volunteer) }

  let(:controller) do
    double(:controller).tap do |c|
      allow(c).to receive(:redirect_to)
      allow(c).to receive(:login).with(volunteer)
      allow(c).to receive(:current_user)
    end
  end

  it 'logs in the user and take them to the reset password form' 

end

