# frozen_string_literal: true

describe Admin::PodsController, type: :controller do
  before do
    @user = FactoryGirl.create :user
    Role.add_admin(@user.person)

    sign_in @user, scope: :user
  end

  describe "#index" do
    it "renders the pod list template" 


    it "contains the preloads" 


    it "returns the json data" 

  end

  describe "#recheck" do
    before do
      @pod = FactoryGirl.create(:pod).reload
      allow(Pod).to receive(:find) { @pod }
      expect(@pod).to receive(:test_connection!)
    end

    it "performs a connection test" 


    it "performs a connection test (format: json)" 

  end
end

