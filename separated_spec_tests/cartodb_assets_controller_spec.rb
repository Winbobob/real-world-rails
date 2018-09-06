# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/assets_controller'

describe Carto::Api::AssetsController do
  describe '#show legacy tests' do
    before(:all) do
      @user = create_user
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      host! "#{@user.username}.localhost.lan"
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    let(:params) { { api_key: @user.api_key } }

    it "gets all assets" 

  end
end

