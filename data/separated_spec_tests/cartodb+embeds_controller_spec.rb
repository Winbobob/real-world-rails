require_relative '../../../../spec_helper'
require_relative '../../../../factories/organizations_contexts.rb'
require 'helpers/feature_flag_helper'

describe Carto::Builder::Public::EmbedsController do
  include Warden::Test::Helpers, Carto::Factories::Visualizations, HelperMethods
  include FeatureFlagHelper

  before(:all) do
    bypass_named_maps
    @user = FactoryGirl.create(:valid_user, private_maps_enabled: true)
    @carto_user = Carto::User.find(@user.id)
    @map = FactoryGirl.create(:map, user_id: @user.id)
    @visualization = FactoryGirl.create(:carto_visualization, user: @carto_user, map_id: @map.id, version: 3)
    # Only mapcapped visualizations are presented by default
    Carto::Mapcap.create!(visualization_id: @visualization.id)
  end

  before(:each) do
    bypass_named_maps
    Carto::Visualization.any_instance.stubs(:organization?).returns(false)
    Carto::Visualization.any_instance.stubs(:get_auth_tokens).returns(['trusty_token'])
  end

  after(:all) do
    @map.destroy
    @visualization.destroy
    User[@user.id].destroy
    @feature_flag.destroy
  end

  def stub_passwords(password)
    Carto::Visualization.any_instance.stubs(:has_password?).returns(true)
    Carto::Visualization.any_instance.stubs(:password_valid?).returns(false)
    Carto::Visualization.any_instance.stubs(:password_valid?).with(password).returns(true)
  end

  TEST_PASSWORD = 'manolo'.freeze

  describe '#show' do
    it 'does not display public visualizations without mapcaps' 


    it 'does not display link visualizations without mapcaps' 


    it 'does not display visualizations without mapcaps' 


    it 'displays published layers, not ("live") visualization layers' 


    it 'embeds visualizations' 


    it 'sends caching headers' 


    describe 'connectivity issues' do
      it 'does not need connection to the user db' 

    end

    it 'redirects to builder for v2 visualizations' 


    it 'does not include auth tokens for public/link visualizations' 


    it 'does not include google maps if not configured' 


    it 'includes the google maps client id if configured' 


    it 'does not includes google maps if the maps does not need it' 


    it 'includes 3rd party scripts for analytics' 


    it 'does not include 3rd party scripts if cookies=0 query param is present' 


    it 'does not embed password protected viz' 


    it 'returns 404 for inexistent visualizations' 


    describe 'private visualizations' do
      it 'cannot be embedded' 


      it 'can be embedded if logged in' 


      it 'include auth tokens in embed' 

    end

    describe 'in organizations' do
      include_context 'organization with users helper'

      before(:each) do
        @org_map = FactoryGirl.create(:map, user_id: @org_user_owner.id)
        @org_visualization = FactoryGirl.create(:carto_visualization, user: @carto_org_user_owner, map_id: @org_map.id, version: 3)
        @org_visualization.privacy = Carto::Visualization::PRIVACY_PRIVATE
        @org_visualization.save

        # Only mapcapped visualizations are presented by default
        Carto::Mapcap.create!(visualization_id: @org_visualization.id)

        share_visualization(@org_visualization, @org_user_1)
        Carto::Visualization.any_instance.unstub(:organization?)
        Carto::Visualization.any_instance.stubs(:needed_auth_tokens).returns([])

        @org_map2 = FactoryGirl.create(:map, user_id: @org_user_owner.id)

        @org_protected_visualization = FactoryGirl.create(
          :carto_visualization,
          user: @carto_org_user_owner,
          map_id: @org_map2.id,
          version: 3,
          privacy: Carto::Visualization::PRIVACY_PROTECTED,
          encrypted_password: 'xxx',
          password_salt: 'yyy'
        )
        share_visualization(@org_protected_visualization, @org_user_1)
      end

      it 'does not embed private visualizations' 


      it 'embeds private visualizations if logged in as allowed user' 


      it 'embeds protected visualizations if logged in as allowed user with the right password' 


      it 'returns 403 for private visualizations if logged in is not an allowed user' 


      it 'includes auth tokens for privately shared visualizations' 


      it 'includes the organizations google maps client id if configured' 

    end
  end

  describe '#show_protected' do
    it 'does not display visualizations without mapcaps' 


    it 'does display published visualizations' 


    it 'rejects incorrect passwords' 


    it 'accepts correct passwords' 


    it 'includes auth tokens' 

  end
end

