require 'spec_helper'

describe 'User features', type: :feature do
  def host_with_port
    host_with_port = current_host
    if Capybara.current_session.server
      host_with_port += ":#{Capybara.current_session.server.port}"
    end
    host_with_port
  end

  def asset_url(relative_path)
    "#{host_with_port}#{Rails.application.config.assets.prefix}/#{relative_path}"
  end

  it 'should return the user profile name when sharing user profile' 


  context 'should handle returning appropriate image when sharing user profile' do
    context 'when favorite_crop is present' do
      let(:user) { FactoryGirl.create(:user, :with_user_setting) }
      it 'returns favorite_crop image' 

    end

    context 'when favorite_crop is not present' do
      let(:user) { FactoryGirl.create(:user, :with_user_setting) }
      it 'returns OpenFarm image' 

    end
  end
end

