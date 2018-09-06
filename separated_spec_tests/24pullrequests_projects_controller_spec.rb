require 'rails_helper'

describe ProjectsController, type: :controller do
  let(:project) { create :project }

  describe 'GET index' do
    context 'as json' do
      before do
        create :project
        get :index, params: {format: :json}
      end

      it { expect(response.header['Content-Type']).to include 'application/json' }
    end

    context 'filter' do
      let!(:ruby) do
        create_list :project, 5, main_language: 'Ruby'
      end

      let!(:python) do
        create_list :project, 5, main_language: 'Python'
      end

      it 'from params' 


      it 'from session filter_options' 


      it 'from current_user languages' 


      it 'searches all projects with empty arrays' 


      it 'label is passed to search' 

    end
  end

  describe 'POST create mass assignment' do
    it 'should allow mass assignment for certain parameters' 


    it 'should not allow mass assignment for others' 

  end

  describe 'POST claim' do
    let(:unclaimed_project) { create :project, submitted_by: nil }
    let(:user) { create(:user) }
    let(:claimed_project) { create :project }

    before do
      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      session[:user_id] = user.id
    end

    describe 'successful claim' do
      it 'should successfully claim ownership of an unclaimed project' 

    end

    describe 'failed claim' do
      it 'should fail when claiming an already claimed project' 

    end
  end

  describe 'GET autofill' do
    context 'Logged in' do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
      end

      it 'Repo with labels' 


      it "Removes trailing slashes" 


    end

    it 'Logged out' 

  end
end

