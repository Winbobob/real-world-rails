require 'rails_helper'

describe SessionsController do

  describe "#destroy" do
    before do
      allow(controller).to receive(:current_user=)

      get :destroy
    end

    it "sets current_user to nil" 


    it "redirects to root_path with a notice" 

  end

end

