require 'rails_helper'

RSpec.describe Backend::Api::Cloud do
  context '#upload' do
    let(:user) { create(:confirmed_user) }
    let!(:ec2_configuration) { create(:ec2_configuration, user: user) }

    it 'crafts a correct backend request' 

  end
end

