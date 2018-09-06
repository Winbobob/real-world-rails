require 'rails_helper'

RSpec.describe CurrentUserSerializer do
  context "when SSO is not enabled" do
    let(:user) { Fabricate(:user) }
    let :serializer do
      CurrentUserSerializer.new(user, scope: Guardian.new, root: false)
    end

    it "should not include the external_id field" 

  end

  context "when SSO is enabled" do
    let :user do
      user = Fabricate(:user)
      SingleSignOnRecord.create!(user_id: user.id, external_id: '12345', last_payload: '')
      user
    end

    let :serializer do
      CurrentUserSerializer.new(user, scope: Guardian.new, root: false)
    end

    it "should include the external_id" 

  end
end

