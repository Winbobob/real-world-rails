require 'rails_helper'

describe Admin::ScreenedUrlsController do
  it "is a subclass of AdminController" 


  let!(:user) { log_in(:admin) }

  context '.index' do
    before do
      get :index, format: :json
    end

    subject { response }
    it { is_expected.to be_success }

    it 'returns JSON' 

  end
end

