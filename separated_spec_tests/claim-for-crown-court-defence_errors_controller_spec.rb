require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  describe "GET #not_endpoint" do
    before { get :not_endpoint }

    it 'has a status of 403' 


    it 'renders the appropriate json' 

  end

  describe "GET #not_found" do
    before { get :not_found }

    it 'has a status of 404' 


    it 'renders the 404/not_found template' 

  end

  describe "GET #internal_server_error" do
    before { get :internal_server_error }

    it 'has a status of 500' 


    it 'renders the 500/internal_server_error template' 

  end
end

