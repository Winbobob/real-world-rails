require 'spec_helper'

describe Gitlab::Prometheus::Queries::DeploymentQuery do
  let(:environment) { create(:environment, slug: 'environment-slug') }
  let(:deployment) { create(:deployment, environment: environment) }

  let(:client) { double('prometheus_client') }
  subject { described_class.new(client) }

  around do |example|
    time_without_subsecond_values = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(time_without_subsecond_values) { example.run }
  end

  it 'sends appropriate queries to prometheus' 

end

