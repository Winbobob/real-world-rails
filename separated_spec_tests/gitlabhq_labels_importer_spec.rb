require 'spec_helper'

describe Gitlab::GithubImport::Importer::LabelsImporter, :clean_gitlab_redis_cache do
  let(:project) { create(:project, import_source: 'foo/bar') }
  let(:client) { double(:client) }
  let(:importer) { described_class.new(project, client) }

  describe '#execute' do
    it 'imports the labels in bulk' 

  end

  describe '#build_labels' do
    it 'returns an Array containnig label rows' 


    it 'does not create labels that already exist' 

  end

  describe '#build_labels_cache' do
    it 'builds the labels cache' 

  end

  describe '#build' do
    let(:label_hash) do
      importer.build(double(:label, name: 'bug', color: 'ffffff'))
    end

    it 'returns the attributes of the label as a Hash' 


    context 'the returned Hash' do
      it 'includes the label title' 


      it 'includes the label color' 


      it 'includes the project ID' 


      it 'includes the label type' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 

    end
  end

  describe '#each_label' do
    it 'returns the labels' 

  end
end

