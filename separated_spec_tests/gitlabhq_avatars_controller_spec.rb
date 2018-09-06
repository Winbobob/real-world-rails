require 'spec_helper'

describe Profiles::AvatarsController do
  let(:user)    { create(:user, avatar: fixture_file_upload(Rails.root + "spec/fixtures/dk.png")) }

  before do
    sign_in(user)
    controller.instance_variable_set(:@user, user)
  end

  it 'removes avatar from DB by calling destroy' 

end

