require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180511174224_add_unique_constraint_to_project_features_project_id.rb')

describe AddUniqueConstraintToProjectFeaturesProjectId, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:features) { table(:project_features) }
  let(:migration) { described_class.new }

  describe '#up' do
    before do
      (1..3).each do |i|
        namespaces.create(id: i, name: "ns-test-#{i}", path: "ns-test-i#{i}")
        projects.create!(id: i, name: "test-#{i}", path: "test-#{i}", namespace_id: i)
      end

      features.create!(id: 1, project_id: 1)
      features.create!(id: 2, project_id: 1)
      features.create!(id: 3, project_id: 2)
      features.create!(id: 4, project_id: 2)
      features.create!(id: 5, project_id: 2)
      features.create!(id: 6, project_id: 3)
    end

    it 'creates a unique index and removes duplicates' 

  end

  describe '#down' do
    it 'restores the original index' 

  end
end

