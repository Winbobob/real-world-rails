require 'rails_helper'

describe ProfilesController do
  before do
    @user = create(:user)
    @other_user = create(:user)
    sign_in @user
  end

  describe "showing profiles" do
    render_views

    it "lets users view their own profile" 


    it "lets users view other user's profiles" 

  end
end

