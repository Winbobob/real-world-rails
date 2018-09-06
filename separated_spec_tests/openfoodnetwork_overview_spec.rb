require 'spec_helper'

feature %q{
  As a backend user
  I want to be given information about the state of my enterprises, products and order cycles
}, js: true do
  include AuthenticationWorkflow
  include WebHelper
  include ::Spree::TestingSupport::AuthorizationHelpers

  context "as an enterprise user" do
    before do
      @enterprise_user = create_enterprise_user
      Spree::Admin::OverviewController.any_instance.stub(:spree_current_user).and_return @enterprise_user
      quick_login_as @enterprise_user
    end

    context "with an enterprise" do
      let(:d1) { create(:distributor_enterprise) }

      before :each do
        @enterprise_user.enterprise_roles.build(enterprise: d1).save
      end

      it "displays a link to the map page" 


      context "when visibilty is set to false" do
        before do
          d1.visible = false
          d1.save!
        end

        it "displays a message telling how to set visibility" 

      end

      pending "when user is a profile only" do
        before do
          d1.sells = "none"
          d1.save!
        end

        it "does not show a products item" 

      end
    end

    context "with multiple enterprises" do
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }

      before :each do
        @enterprise_user.enterprise_roles.build(enterprise: d1).save
        @enterprise_user.enterprise_roles.build(enterprise: d2).save
      end

      it "displays information about the enterprise" 


      context "but no products or order cycles" do
        it "prompts the user to create a new product and to manage order cycles" 

      end

      context "and at least one product and active order cycle" do
        let(:oc1) { create(:simple_order_cycle, distributors: [d1]) }
        let(:p1) { create(:product, distributor: d1) }

        it "displays information about products and order cycles" 

      end
    end

    context "with the spree dash configured" do
      let(:d1) { create(:distributor_enterprise) }

      before do
        stub_jirafe
        @enterprise_user.enterprise_roles.build(enterprise: d1).save
      end

      around do |example|
        with_dash_configured { example.run }
      end

      it "has permission to sync analytics" 

    end
  end

  private

  def stub_jirafe
    stub_request(:post, "https://api.jirafe.com/v1/applications/abc123/resources?token=").
      to_return(:status => 200, :body => "", :headers => {})
  end

  def with_dash_configured(&block)
    Spree::Dash::Config.preferred_app_id = 'abc123'
    Spree::Dash::Config.preferred_site_id = 'abc123'
    Spree::Dash::Config.preferred_token = 'abc123'
    expect(Spree::Dash::Config.configured?).to be true

    block.call
  ensure
    Spree::Dash::Config.preferred_app_id = nil
    Spree::Dash::Config.preferred_site_id = nil
    Spree::Dash::Config.preferred_token = nil
    expect(Spree::Dash::Config.configured?).to be false
  end
end

