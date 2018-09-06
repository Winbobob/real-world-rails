require 'spec_helper'

describe Gitlab::ImportExport::Reader  do
  let(:shared) { Gitlab::ImportExport::Shared.new(nil) }
  let(:test_config) { 'spec/support/import_export/import_export.yml' }
  let(:project_tree_hash) do
    {
      except: [:id, :created_at],
      include: [:issues, :labels,
                { merge_requests: {
                  only: [:id],
                  except: [:iid],
                  include: [:merge_request_diff, :merge_request_test]
                } },
                { commit_statuses: { include: :commit } },
                { project_members: { include: { user: { only: [:email] } } } }]
    }
  end

  before do
    allow_any_instance_of(Gitlab::ImportExport).to receive(:config_file).and_return(test_config)
  end

  it 'generates hash from project tree config' 


  context 'individual scenarios' do
    it 'generates the correct hash for a single project relation' 


    it 'generates the correct hash for a single project feature relation' 


    it 'generates the correct hash for a multiple project relation' 


    it 'generates the correct hash for a single sub-relation' 


    it 'generates the correct hash for a multiple sub-relation' 


    it 'generates the correct hash for a sub-relation with another sub-relation' 


    it 'generates the correct hash for a relation with included attributes' 


    it 'generates the correct hash for a relation with excluded attributes' 


    it 'generates the correct hash for a relation with both excluded and included attributes' 


    it 'generates the correct hash for a relation with custom methods' 


    it 'generates the correct hash for group members' 


    def setup_yaml(hash)
      allow(YAML).to receive(:load_file).with(test_config).and_return(hash)
    end
  end
end

