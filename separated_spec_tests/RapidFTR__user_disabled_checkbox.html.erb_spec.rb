require 'spec_helper'

describe 'users/_user_disabled_checkbox.html.erb', :type => :view do
  describe 'Viewing users disabled status as a checkbox' do

    describe 'when current user is the same' do
      it 'should not show checkbox' 

    end

    describe 'when current user is not the same' do
      before :each do
        @user = User.new
        @user.user_name = 'someusername'
      end

      it 'should show checkbox as NOT checked for enabled user' 


      it 'should show checkbox as checked for disabled user' 

    end

  end
end

