require 'rails_helper'

RSpec.describe WebHookUserSerializer do
  let(:user) do
    user = Fabricate(:user)
    SingleSignOnRecord.create!(user_id: user.id, external_id: '12345', last_payload: '')
    user
  end

  let(:admin) { Fabricate(:admin) }

  let :serializer do
    WebHookUserSerializer.new(user, scope: Guardian.new(admin), root: false)
  end

  it "should include relevant user info" 

end

