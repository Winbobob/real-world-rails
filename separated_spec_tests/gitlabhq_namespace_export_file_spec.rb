require 'spec_helper'

describe 'Import/Export - Namespace export file cleanup', :js do
  let(:export_path) { Dir.mktmpdir('namespace_export_file_spec') }

  before do
    allow(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)
  end

  after do
    FileUtils.rm_rf(export_path, secure: true)
  end

  shared_examples_for 'handling project exports on namespace change' do
    let!(:old_export_path) { project.export_path }

    before do
      sign_in(create(:admin))

      setup_export_project
    end

    context 'moving the namespace' do
      it 'removes the export file' 

    end

    context 'deleting the namespace' do
      it 'removes the export file' 

    end
  end

  describe 'legacy storage' do
    let(:project) { create(:project, :legacy_storage) }

    it_behaves_like 'handling project exports on namespace change'
  end

  describe 'hashed storage' do
    let(:project) { create(:project) }

    it_behaves_like 'handling project exports on namespace change'
  end

  def setup_export_project
    visit edit_project_path(project)

    expect(page).to have_content('Export project')

    find(:link, 'Export project').send_keys(:return)

    visit edit_project_path(project)

    expect(page).to have_content('Download export')
  end
end

