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

  context "#top_category_ids" do
    let(:user) { Fabricate(:user) }
    let(:category1) { Fabricate(:category) }
    let(:category2) { Fabricate(:category) }
    let(:category3) { Fabricate(:category) }
    let :serializer do
      CurrentUserSerializer.new(user, scope: Guardian.new, root: false)
    end

    it "should include empty top_category_ids array" 


    it "should include correct id in top_category_ids array" 

  end
end

