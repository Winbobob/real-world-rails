# encoding: utf-8

require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170803090603_calculate_conv_dev_index_percentages.rb')

describe CalculateConvDevIndexPercentages, :delete do
  let(:migration) { described_class.new }
  let!(:conv_dev_index) do
    create(:conversational_development_index_metric, # rubocop:disable RSpec/FactoriesInMigrationSpecs
      leader_notes: 0,
      instance_milestones: 0,
      percentage_issues: 0,
      percentage_notes: 0,
      percentage_milestones: 0,
      percentage_boards: 0,
      percentage_merge_requests: 0,
      percentage_ci_pipelines: 0,
      percentage_environments: 0,
      percentage_deployments: 0,
      percentage_projects_prometheus_active: 0,
      percentage_service_desk_issues: 0)
  end

  describe '#up' do
    it 'calculates percentages correctly' 

  end
end

