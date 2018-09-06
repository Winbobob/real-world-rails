require 'rails_helper'

describe 'External Event' do
  let(:admin_user) { create(:user, admin: true) }
  let!(:region) { create(:region) }
  let!(:chapter) { create(:chapter) }

  before do
    sign_in_as(admin_user)
  end

  it "can create a new external event" 

end

