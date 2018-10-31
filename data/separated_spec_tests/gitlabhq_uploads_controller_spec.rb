require 'spec_helper'

describe Projects::UploadsController do
  let(:model) { create(:project, :public) }
  let(:params) do
    { namespace_id: model.namespace.to_param, project_id: model }
  end

  it_behaves_like 'handle uploads'

  context 'when the URL the old style, without /-/system' do
    it 'responds with a redirect to the login page' 

  end
end

