require 'spec_helper'

describe API::Settings, 'Settings' do
  let(:user) { create(:user) }
  set(:admin) { create(:admin) }

  describe "GET /application/settings" do
    it "returns application settings" 

  end

  describe "PUT /application/settings" do
    let(:group) { create(:group) }

    context "custom repository storage type set in the config" do
      before do
        # Add a possible storage to the config
        storages = Gitlab.config.repositories.storages
                     .merge({ 'custom' => 'tmp/tests/custom_repositories' })
        allow(Gitlab.config.repositories).to receive(:storages).and_return(storages)
      end

      it "updates application settings" 

    end

    it "supports legacy performance_bar_allowed_group_id" 


    it "supports legacy performance_bar_enabled" 


    context "missing plantuml_url value when plantuml_enabled is true" do
      it "returns a blank parameter error message" 

    end
  end
end

