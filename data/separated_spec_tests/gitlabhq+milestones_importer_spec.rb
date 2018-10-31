require 'spec_helper'

describe Gitlab::GithubImport::Importer::MilestonesImporter, :clean_gitlab_redis_cache do
  let(:project) { create(:project, import_source: 'foo/bar') }
  let(:client) { double(:client) }
  let(:importer) { described_class.new(project, client) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:milestone) do
    double(
      :milestone,
      number: 1,
      title: '1.0',
      description: 'The first release',
      state: 'open',
      created_at: created_at,
      updated_at: updated_at
    )
  end

  describe '#execute' do
    it 'imports the milestones in bulk' 


    it 'tracks internal ids' 

  end

  describe '#build_milestones' do
    it 'returns an Array containnig milestone rows' 


    it 'does not create milestones that already exist' 

  end

  describe '#build_milestones_cache' do
    it 'builds the milestones cache' 

  end

  describe '#build' do
    let(:milestone_hash) { importer.build(milestone) }

    it 'returns the attributes of the milestone as a Hash' 


    context 'the returned Hash' do
      it 'includes the milestone number' 


      it 'includes the milestone title' 


      it 'includes the milestone description' 


      it 'includes the project ID' 


      it 'includes the milestone state' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 

    end
  end

  describe '#each_milestone' do
    it 'returns the milestones' 

  end
end

