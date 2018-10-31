# frozen_string_literal: true

describe Api::OpenidConnect::UserInfoController do
  let!(:auth_with_read_and_ppid) { FactoryGirl.create(:auth_with_read_and_ppid) }
  let!(:access_token_with_read) { auth_with_read_and_ppid.create_access_token.to_s }

  describe "#show" do
    before do
      @user = auth_with_read_and_ppid.user
      get api_openid_connect_user_info_path, params: {access_token: access_token_with_read}
    end

    it "shows the info" 

  end
end

