require 'spec_helper'

describe Emails::CreateService do
  let(:user) { create(:user) }
  let(:opts) { { email: 'new@email.com', user: user } }

  subject(:service) { described_class.new(user, opts) }

  describe '#execute' do
    it 'creates an email with valid attributes' 


    it 'creates an email with additional attributes' 


    it 'has the right user association' 

  end
end

