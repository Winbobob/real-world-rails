require 'rails_helper'

RSpec.describe Settings::ImportsController, type: :controller do
  render_views

  before do
    sign_in Fabricate(:user), scope: :user
  end

  describe "GET #show" do
    it "returns http success" 

  end

  describe 'POST #create' do
    it 'redirects to settings path with successful following import' 


    it 'redirects to settings path with successful blocking import' 

  end
end

