require 'rails_helper'

describe HomeController do

  describe '#show' do
    before do
      allow(controller).to receive(:render)
      get :show
    end

    it "renders template with HomePagePresenter as page" 

  end

end

