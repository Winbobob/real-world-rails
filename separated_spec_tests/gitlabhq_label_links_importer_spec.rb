require 'spec_helper'

describe Gitlab::GithubImport::Importer::LabelLinksImporter do
  let(:project) { create(:project) }
  let(:client) { double(:client) }
  let(:issue) do
    double(
      :issue,
      iid: 4,
      label_names: %w[bug],
      issuable_type: Issue,
      pull_request?: false
    )
  end

  let(:importer) { described_class.new(issue, project, client) }

  describe '#execute' do
    it 'creates the label links' 

  end

  describe '#create_labels' do
    it 'inserts the label links in bulk' 


    it 'does not insert label links for non-existing labels' 

  end

  describe '#find_target_id' do
    it 'returns the ID of the issuable to create the label link for' 

  end
end

