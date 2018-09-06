require 'spec_helper'

describe AdminsController do

  before :each do
    # Authenticate user is not timed out, and has administrator rights.
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(build(:admin))
  end

  context 'An Admin should' do
    it 'be able to get :new' 


    it 'respond with success on index' 


    it 'be able to create Admin' 


    context 'with a second user' do
      before do
        @a2 = Admin.create(user_name: 'admin2',
                         last_name: 'admin2',
                         first_name: 'admin2')
      end

      it 'be able to update' 


      it 'be able to edit' 

    end
  end

end

