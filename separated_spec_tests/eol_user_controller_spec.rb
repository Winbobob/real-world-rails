require File.dirname(__FILE__) + '/../../spec_helper'

describe Administrator::UserController do
  before(:all) do
    truncate_all_tables
    Language.create_english
    @admin = User.gen(:username => "admin", :password => "admin")
    @admin.grant_admin
    @non_admin = User.gen(:username => "non_admin", :password => "non_admin")
    @user = User.gen(:username => "user", :password => "user")
  end
  describe "GET deactivate" do
    context "when current_user is admin" do
      before do
        session[:user_id] = @admin.id
        allow(controller).to receive(:current_user) { @admin }
      end
      it "allows admin to deactivate users" 

      it "doesn't allow admin to deactivate himself" 

    end
    context "when current_user is not admin" do
      before do
        @non_admin.update_column(:active, true)
        @user.update_column(:active, true)
        session[:user_id] = @non_admin.id
        allow(controller).to receive(:current_user) { @non_admin }
      end
      it "doesn't allow non admin to deactivate himself" 

      it "doesn't allow non admin to deactivate any user" 

    end
    
    context "when there isn't any logged in user" do
      before do
        session[:user_id] = nil
        allow(controller).to receive(:current_user) { nil }
      end
      it "doesn't allow to deactivate any user" 

    end
  end
end

