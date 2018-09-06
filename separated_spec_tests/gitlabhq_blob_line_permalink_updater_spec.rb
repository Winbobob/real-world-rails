require 'spec_helper'

feature 'Blob button line permalinks (BlobLinePermalinkUpdater)', :js do
  include TreeHelper

  let(:project) { create(:project, :public, :repository) }
  let(:path) { 'CHANGELOG' }
  let(:sha) { project.repository.commit.sha }

  describe 'On a file(blob)' do
    def get_absolute_url(path = "")
      "http://#{page.server.host}:#{page.server.port}#{path}"
    end

    def visit_blob(fragment = nil)
      visit project_blob_path(project, tree_join('master', path), anchor: fragment)
    end

    describe 'Click "Permalink" button' do
      it 'works with no initial line number fragment hash' 


      it 'maintains intitial fragment hash' 


      it 'changes fragment hash if line number clicked' 


      it 'with initial fragment hash, changes fragment hash if line number clicked' 

    end

    describe 'Click "Blame" button' do
      it 'works with no initial line number fragment hash' 


      it 'maintains intitial fragment hash' 


      it 'changes fragment hash if line number clicked' 


      it 'with initial fragment hash, changes fragment hash if line number clicked' 

    end
  end
end

