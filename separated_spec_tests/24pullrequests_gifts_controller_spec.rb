require 'rails_helper'

describe GiftsController, type: :controller do
  let(:user) { create(:user) }
  let(:gift) { create(:gift, user: user) }
  let!(:pull_requests) { 2.times.map { create :pull_request, user: user } }

  before do
    allow_any_instance_of(User).to receive(:admin?).and_return(true)
    session[:user_id] = user.id
  end

  describe 'DELETE destroy' do
    it 'removes the gift' 

  end

  describe 'GET new' do
    render_views

    it 'should pre-fill the date when one is passed' 

  end
end

