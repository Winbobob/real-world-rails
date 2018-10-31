# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join("db", "importers", "common_metrics_importer.rb")

describe Importers::PrometheusMetric do
  it 'group enum equals ::PrometheusMetric' 


  it 'GROUP_TITLES equals ::PrometheusMetric' 

end

describe Importers::CommonMetricsImporter do
  subject { described_class.new }

  context "does import common_metrics.yml" do
    let(:groups) { subject.content }
    let(:metrics) { groups.map { |group| group['metrics'] }.flatten }
    let(:queries) { metrics.map { |group| group['queries'] }.flatten }
    let(:query_ids) { queries.map { |query| query['id'] } }

    before do
      subject.execute
    end

    it "has the same amount of groups" 


    it "has the same amount of metrics" 


    it "has the same amount of queries" 


    it "does not have duplicate IDs" 


    it "imports all IDs" 

  end

  context "does import common_metrics.yml" do
    it "when executed from outside of the Rails.root" 

  end

  context 'does import properly all fields' do
    let(:query_identifier) { 'response-metric' }
    let(:group) do
      {
        group: 'Response metrics (NGINX Ingress)',
        metrics: [{
          title: "Throughput",
          y_label: "Requests / Sec",
          queries: [{
            id: query_identifier,
            query_range: 'my-query',
            unit: 'my-unit',
            label: 'status code'
          }]
        }]
      }
    end

    before do
      expect(subject).to receive(:content) { [group.deep_stringify_keys] }
    end

    shared_examples 'stores metric' do
      let(:metric) { PrometheusMetric.find_by(identifier: query_identifier) }

      it 'with all data' 

    end

    context 'if ID is missing' do
      let(:query_identifier) { }

      it 'raises exception' 

    end

    context 'for existing common metric with different ID' do
      let!(:existing_metric) { create(:prometheus_metric, :common, identifier: 'my-existing-metric') }

      before do
        subject.execute
      end

      it_behaves_like 'stores metric' do
        it 'and existing metric is not changed' 

      end
    end

    context 'when metric with ID exists ' do
      let!(:existing_metric) { create(:prometheus_metric, :common, identifier: 'response-metric') }

      before do
        subject.execute
      end

      it_behaves_like 'stores metric' do
        it 'and existing metric is changed' 

      end
    end
  end
end

