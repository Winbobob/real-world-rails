require 'rails_helper'

RSpec.describe SingleSignOnRecordSerializer do
  let(:user) { Fabricate(:user) }
  let :sso do
    SingleSignOnRecord.create!(user_id: user.id, external_id: '12345', external_email: user.email, last_payload: '')
  end

  context "admin" do
    let(:admin) { Fabricate(:admin) }
    let :serializer do
      SingleSignOnRecordSerializer.new(sso, scope: Guardian.new(admin), root: false)
    end

    it "should include user sso info" 

  end

  context "moderator" do
    let(:moderator) { Fabricate(:moderator) }
    let :serializer do
      SingleSignOnRecordSerializer.new(sso, scope: Guardian.new(moderator), root: false)
    end

    it "should include user sso info" 

  end
end

