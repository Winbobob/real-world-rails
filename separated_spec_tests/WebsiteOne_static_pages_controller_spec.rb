require 'spec_helper'

describe StaticPagesController, :type => :controller do

  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:page) { FactoryBot.create(:static_page) }
  let(:valid_attributes) do
    {
        'title' => 'MyString',
        'body' => 'MyText'
    }
  end
  let(:valid_session) { {} }

  before(:each) do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user) { user }
    allow(user).to receive(:touch)
  end

  describe 'GET show' do

    before(:each) do
      get :show, params: { id: page.to_param }.merge(valid_session)
    end

    it 'assigns the requested page as page' 


    it 'renders the show template' 


    it 'assigns the requested page ancestry as the page.title' 


    it 'assigns the requested child page ancestry as @ancestry' 

  end
end

