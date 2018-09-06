require 'spec_helper'

describe Gitlab::Prometheus::Queries::AdditionalMetricsDeploymentQuery do
  around do |example|
    Timecop.freeze(Time.local(2008, 9, 1, 12, 0, 0)) { example.run }
  end

  include_examples 'additional metrics query' do
    let(:deployment) { create(:deployment, environment: environment) }
    let(:query_params) { [deployment.id] }

    it 'queries using specific time' 

  end
end

