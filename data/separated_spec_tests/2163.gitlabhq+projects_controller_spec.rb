require 'spec_helper'

describe Admin::ProjectsController do
  let!(:project) { create(:project, :public) }

  before do
    sign_in(create(:admin))
  end

  describe 'GET /projects' do
    render_views

    it 'retrieves the project for the given visibility level' 


    it 'does not retrieve the project' 


    it 'does not respond with projects pending deletion' 


    it 'does not have N+1 queries', :use_clean_rails_memory_store_caching, :request_store do
      get :index

      control_count = ActiveRecord::QueryRecorder.new { get :index }.count

      create(:project)

      expect { get :index }.not_to exceed_query_limit(control_count)
    end
  end

  describe 'GET /projects/:id' do
    render_views

    it 'renders show page' 

  end
end

