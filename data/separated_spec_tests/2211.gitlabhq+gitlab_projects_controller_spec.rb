require 'spec_helper'

describe Import::GitlabProjectsController do
  set(:namespace) { create(:namespace) }
  set(:user) { namespace.owner }
  let(:file) { fixture_file_upload('spec/fixtures/project_export.tar.gz', 'text/plain') }

  before do
    sign_in(user)
  end

  describe 'POST create' do
    context 'with an invalid path' do
      it 'redirects with an error' 


      it 'redirects with an error when a relative path is used' 

    end

    context 'with a valid path' do
      it 'redirects to the new project path' 

    end
  end
end

