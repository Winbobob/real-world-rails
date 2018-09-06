require "rails_helper"

RSpec.describe UsersController, type: :controller do
  render_views
  fixtures :users, :assets

  context 'creating' do
    it "should successfully post to users/create" 


    it "should send user activation email after signup" 


    it "should have actually created the user" 


    it 'should reset the perishable token' 


    it "should require login on signup" 


    it "should require password on signup" 


    it "should require password confirmation on signup" 


    it "should require email on signup" 

  end

  context 'activation' do

    it "should activate with a for reals perishable token" 


    it 'should log in user on activation' 


    it 'should send out email on activation' 


    it "should not activate with bullshit perishable token" 


    it 'should NOT activate an account if you are already logged in' 


    it 'should NOT activate if you are on a shitty ass IP' 


  end
  context "profile" do

    fixtures :users, :assets
    [:sudara, :arthur].each do |user|
      it "should let a user or admin edit" 


      it "should let a user or admin update" 

    end

    it "should let a user upload a new photo" 


    it "should not let a user upload a new photo for another user" 


    it "should let a user change their login" 


    it 'should not let a user change login to login that exists' 


    it "should not let any old user edit" 


    it "should not let any old user update" 


    it "should not let a logged out user edit" 


    it 'should deliver an rss feed for any user, to anyone' 

  end

  context "favoriting" do
    subject { get :toggle_favorite, params: { asset_id: 100 }, xhr: true }

    it 'should not let a guest favorite a track' 


    it 'should let a user favorite a track' 


    it 'should let a user unfavorite a track' 

  end

  context "sudo" do
    it "should not let a normal user sudo" 


    it "should let an admin user sudo" 


    it "should let an sudo'd user return to their admin account" 


    it "should not update IP or last_request_at" 

  end

  context "last request at" do
    it "should touch last_request_at when logging in" 


    # it "should touch last_request_at when doing anything" do
    #   Timecop.travel(12.minute.ago)
    #    login(:arthur)
    #   Timecop.travel(1.minute.ago)
    #   expect { get :index }.to change{ User.find_by_login("arthur").last_request_at}
    #
    # end
    #
    # it "should not touch updated_at when logging in" do
    #   # Authlogic does this by default, which fucks things up
    #   expect { login(:arthur) }.to_not change{ User.find_by_login("arthur").updated_at }
    # end
  end

end

def create_user(options = {})
  Timecop.travel(1.day.ago)
  post :create, params: {user: {:login => 'quire', :email => 'quire@example.com', :password => 'quire12345', :password_confirmation => 'quire12345'}.merge(options)}
  Timecop.return
end
