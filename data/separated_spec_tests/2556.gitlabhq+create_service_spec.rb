require 'spec_helper'

describe Keys::CreateService do
  let(:user) { create(:user) }
  let(:params) { attributes_for(:key) }

  subject { described_class.new(user, params) }

  context 'notification', :mailer do
    it 'sends a notification' 

  end

  it 'creates a key' 

end

