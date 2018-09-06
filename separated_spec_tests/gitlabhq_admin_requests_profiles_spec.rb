require 'spec_helper'

describe 'Admin::RequestsProfilesController' do
  before do
    FileUtils.mkdir_p(Gitlab::RequestProfiler::PROFILES_DIR)
    sign_in(create(:admin))
  end

  after do
    Gitlab::RequestProfiler.remove_all_profiles
  end

  describe 'GET /admin/requests_profiles' do
    it 'shows the current profile token' 


    it 'lists all available profiles' 

  end

  describe 'GET /admin/requests_profiles/:profile' do
    context 'when a profile exists' do
      it 'displays the content of the profile' 

    end

    context 'when a profile does not exist' do
      it 'shows an error message' 

    end
  end
end

