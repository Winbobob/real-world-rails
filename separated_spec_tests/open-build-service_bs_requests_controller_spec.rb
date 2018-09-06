require 'rails_helper'

RSpec.describe Webui::Users::BsRequestsController do
  describe 'GET #index' do
    include_context 'a set of bs requests'

    let(:base_params) { { user: user, format: :json } }
    let(:context_params) { {} }
    let(:params) { base_params.merge(context_params) }

    before do
      get :index, params: params
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(subject).to render_template(:index) }

    it_behaves_like 'a bs requests data table controller'

    context 'with the dataTableId param set to "all_requests_table"' do
      let(:context_params) { { dataTableId: 'all_requests_table' } }

      it 'returns those requests' 


      it 'assigns the total count of records' 

    end

    context 'with the dataTableId param set to "requests_in_table"' do
      let(:context_params) { { dataTableId: 'requests_in_table' } }

      it 'returns no requests' 


      it 'assigns the total count of records' 

    end
  end
end

