require 'spec_helper'

describe ProfileController do
  fixtures :users
  let(:current_user) { User.find_by_login('dan') }
  let(:session) do
    { :user => current_user.id }
  end

  before :each do
    request.env['HTTP_REFERER'] = '/'
  end

  describe 'upload_pic' do
    it 'uploads an avatar in 2 sizes' 

  end

  describe 'delete_images' do
    it 'deletes both avatars' 

  end
end

