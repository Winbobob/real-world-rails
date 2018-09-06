require 'spec_helper_min'
require 'support/helpers'

describe Carto::Api::StaticNotificationsController do
  include Carto::Factories::Visualizations
  include HelperMethods

  before(:all) do
    @user = FactoryGirl.create(:carto_user)
  end

  after(:all) do
    # This avoids connection leaking.
    ::User[@user.id].destroy
  end

  let(:auth_params) do
    { user_domain: @user.username, api_key: @user.api_key }
  end

  let(:notification) do
    { analyses: { georeference: { show: false } } }
  end

  describe '#update' do
    it 'updates the notification for the category' 


    it 'returns 403 if not authenticated' 


    it 'returns 422 with incorrect category' 

  end
end

