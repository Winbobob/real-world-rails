require 'spec_helper'

describe API::NotificationSettings do
  let(:user) { create(:user) }
  let!(:group) { create(:group) }
  let!(:project) { create(:project, :public, creator_id: user.id, namespace: group) }

  describe "GET /notification_settings" do
    it "returns global notification settings for the current user" 

  end

  describe "PUT /notification_settings" do
    let(:email) { create(:email, user: user) }

    it "updates global notification settings for the current user" 

  end

  describe "PUT /notification_settings" do
    it "fails on non-user email address" 

  end

  describe "GET /groups/:id/notification_settings" do
    it "returns group level notification settings for the current user" 

  end

  describe "PUT /groups/:id/notification_settings" do
    it "updates group level notification settings for the current user" 

  end

  describe "GET /projects/:id/notification_settings" do
    it "returns project level notification settings for the current user" 

  end

  describe "PUT /projects/:id/notification_settings" do
    it "updates project level notification settings for the current user" 

  end

  describe "PUT /projects/:id/notification_settings" do
    it "fails on invalid level" 

  end
end

