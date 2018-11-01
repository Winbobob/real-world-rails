require 'rails_helper'

describe Organizer::SessionsController, type: :controller do
  let(:event) { create(:event) }
  before { login(create(:organizer, event: event)) }

  describe "DELETE 'destroy'" do
    it "destroys the session" 

  end

  describe "PUT 'update'" do
    it "can update a session with ajax" 


    it "can set the proposal" 

  end

end

