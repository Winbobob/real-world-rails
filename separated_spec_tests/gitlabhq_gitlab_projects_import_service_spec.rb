require 'spec_helper'

describe Projects::GitlabProjectsImportService do
  set(:namespace) { create(:namespace) }
  let(:path) { 'test-path' }
  let(:file) { fixture_file_upload(Rails.root + 'spec/fixtures/doc_sample.txt', 'text/plain') }
  let(:overwrite) { false }
  let(:import_params) { { namespace_id: namespace.id, path: path, file: file, overwrite: overwrite } }
  subject { described_class.new(namespace.owner, import_params) }

  describe '#execute' do
    context 'with an invalid path' do
      let(:path) { '/invalid-path/' }

      it 'returns an invalid project' 

    end

    context 'with a valid path' do
      it 'creates a project' 

    end

    context 'override params' do
      it 'stores them as import data when passed' 

    end

    context 'when there is a project with the same path' do
      let(:existing_project) { create(:project, namespace: namespace) }
      let(:path) { existing_project.path}

      it 'does not create the project' 


      context 'when overwrite param is set' do
        let(:overwrite) { true }

        it 'creates a project in a temporary full_path' 

      end
    end
  end
end

