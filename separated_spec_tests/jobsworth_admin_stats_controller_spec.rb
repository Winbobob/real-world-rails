require 'spec_helper'

describe AdminStatsController do
  render_views

  describe 'Authorization' do
    context 'If the logged user is not an Admin' do
      before :each do
        sign_in_normal_user
      end

      it 'should redirect to the root path' 


      it 'should display a notificiation' 

    end

    context 'If the logged user is an admin' do
      before :each do
        sign_in_admin
      end

      it 'should allow the user to procced to the desired action' 

    end
  end

  describe "GET 'index'" do
    context 'When the logged user is an admin' do
      before :each do
        sign_in_admin
      end

      it 'should be successful' 

    end
  end
end

