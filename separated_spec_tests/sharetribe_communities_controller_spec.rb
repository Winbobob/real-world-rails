require 'spec_helper'

describe Admin::CommunitiesController, type: :controller do

  before(:each) do
    @community = FactoryGirl.create(:community)
    @request.host = "#{@community.ident}.lvh.me"
    @request.env[:current_marketplace] = @community
    @user = create_admin_for(@community)
    sign_in_for_spec(@user)
  end

  describe "#update_integrations" do
    it "should allow changing twitter_handle" 


    it "should not allow changes to a different community" 

  end

  describe "#update_settings" do
    it "should allow changing 'private'" 


    it "should not allow changes to a different community" 


  end

  describe "#update_look_and_feel" do
    it "should allow changing custom_color1" 


    it "should not allow changes to a different community" 


    it "should allow changing custom_head_script" 


  end

  describe "#update_topbar" do
    before do
      allow(TranslationService::API::Api.translations).to receive(:create)
        .with(anything()).and_return(Result::Success.new("success"))
    end

    it "should update Post new listing button text" 


    it "should not update Post new listing button text with an invalid translation param" 

  end

  describe "#update_new_layout" do
    before do
      # mock NewLayoutViewUtils.enabled_features with params
      allow(NewLayoutViewUtils).to receive(:enabled_features)
        .with(foo: "true", bar: "true").and_return([:foo, :bar])
      allow(NewLayoutViewUtils).to receive(:resolve_disabled)
        .with([:foo, :bar]).and_return([:wat])

      # mock NewLayoutViewUtils.enabled_features with empty params
      allow(NewLayoutViewUtils).to receive(:enabled_features)
        .with({}).and_return([])
      allow(NewLayoutViewUtils).to receive(:resolve_disabled)
        .with([]).and_return([:foo, :bar, :wat])

      # mock feature flag service calls
      allow(FeatureFlagService::API::Api.features).to receive(:enable)
        .with(anything()).and_return(Result::Success.new("success"))
      allow(FeatureFlagService::API::Api.features).to receive(:disable)
        .with(anything()).and_return(Result::Success.new("success"))
    end

    it "should enable given features for a user" 


    it "should disable missing features for a user" 


    it "should enable given features for a community" 


    it "should disable missing features for a community" 


    it "should disable all features when nothind is passed" 

  end

  def attempt_to_update_different_community_with(action, params)
    different_community = FactoryGirl.create(:community)
    put action, params: {id: different_community.id, community: params}
    different_community.reload
    params.each { |key, value| expect(different_community.send(key)).not_to eql(value) }
  end

  def update_community_with(action, params)
    put action, params: {id: @community.id, community: params}
    @community.reload
    params.each { |key, value| expect(@community.send(:[], key)).to eql(value) }
  end

end

