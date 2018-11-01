require "spec_helper"

RSpec.describe "splash/index.html.erb", type: :view do
  let(:page) { Capybara::Node::Simple.new(rendered) }

  context 'Anonymous or non-Admin user with admin_only_tenant_creation=false' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(false)
      allow(controller).to receive(:can?).with(:manage, Account).and_return(false)
      render
    end

    it "displays a 'Get Started' button" 

  end

  context 'Admin user with admin_only_tenant_creation=true' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(true)
      allow(controller).to receive(:can?).with(:manage, Account).and_return(true)
      allow(controller).to receive(:user_signed_in?).and_return(true)
      render
    end

    it "displays a 'Get Started' button" 

  end

  context 'Anonymous user with admin_only_tenant_creation=true' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(true)
      allow(controller).to receive(:can?).with(:manage, Account).and_return(false)
      allow(controller).to receive(:user_signed_in?).and_return(false)
      render
    end

    it "displays a 'Login to get started' button" 

  end

  context 'Authenticated, non-Admin user with admin_only_tenant_creation=true' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(true)
      allow(controller).to receive(:can?).with(:manage, Account).and_return(false)
      allow(controller).to receive(:user_signed_in?).and_return(true)
      render
    end

    it "displays a 'You are not authorized to create tenants' message" 

  end
end

