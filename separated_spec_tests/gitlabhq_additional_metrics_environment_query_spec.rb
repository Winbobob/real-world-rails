require 'spec_helper'

describe Gitlab::Prometheus::Queries::AdditionalMetricsEnvironmentQuery do
  around do |example|
    Timecop.freeze { example.run }
  end

  include_examples 'additional metrics query' do
    let(:query_params) { [environment.id] }

    it 'queries using specific time' 

  end
end

