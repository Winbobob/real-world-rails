require 'spec_helper'

describe Projects::UploadsController do
  include WorkhorseHelpers

  let(:model) { create(:project, :public) }
  let(:params) do
    { namespace_id: model.namespace.to_param, project_id: model }
  end

  it_behaves_like 'handle uploads'

  context 'when the URL the old style, without /-/system' do
    it 'responds with a redirect to the login page' 

  end

  context "when exception occurs" do
    before do
      allow(FileUploader).to receive(:workhorse_authorize).and_raise(SocketError.new)
      sign_in(create(:user))
    end

    it "responds with status internal_server_error" 

  end

  def post_authorize(verified: true)
    request.headers.merge!(workhorse_internal_api_request_header) if verified

    post :authorize, namespace_id: model.namespace, project_id: model.path, format: :json
  end
end

