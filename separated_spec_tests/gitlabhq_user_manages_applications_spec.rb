require 'spec_helper'

describe 'User manages applications' do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit applications_profile_path
  end

  it 'manages applications' 

end

