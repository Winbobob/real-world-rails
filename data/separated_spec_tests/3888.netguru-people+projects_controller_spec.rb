require 'spec_helper'
describe Api::V1::ProjectsController do
  render_views
  before { controller.class.skip_before_filter :authenticate_api! }

  let!(:project1) { create(:project, potential: false) }
  let!(:project2) { create(:project, potential: true) }
  let!(:project3) { create(:project, potential: false, synchronize: false) }
  let(:project_keys) { %w(id name archived potential toggl_bookmark slug) }

  describe 'GET #index' do
    before do
      get :index, format: :json
    end

    it 'returns 200 code' 


    it 'contains current_week fields' 


    it 'does not return potential projects' 


    it 'does not return project which should not be synchronized' 

  end
end

