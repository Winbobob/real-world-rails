require 'rails_helper'

describe AboutController do

  context '.index' do

    it "should display the about page for anonymous user when login_required is false" 


    it 'should redirect to login page for anonymous user when login_required is true' 


    it "should display the about page for logged in user when login_required is true" 

  end
end

