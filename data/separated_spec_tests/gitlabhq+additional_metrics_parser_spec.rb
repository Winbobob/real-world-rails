require 'spec_helper'

describe Gitlab::Prometheus::AdditionalMetricsParser do
  include Prometheus::MetricBuilders

  let(:parser_error_class) { Gitlab::Prometheus::ParsingError }

  describe '#load_groups_from_yaml' do
    subject { described_class.load_groups_from_yaml('dummy.yaml') }

    describe 'parsing sample yaml' do
      let(:sample_yaml) do
        <<-EOF.strip_heredoc
          - group: group_a
            priority: 1
            metrics:
              - title: "title"
                required_metrics: [ metric_a, metric_b ]
                weight: 1
                queries: [{ query_range: 'query_range_a', label: label, unit: unit }]
              - title: "title"
                required_metrics: [metric_a]
                weight: 1
                queries: [{ query_range: 'query_range_empty' }]
          - group: group_b
            priority: 1
            metrics:
              - title: title
                required_metrics: ['metric_a']
                weight: 1
                queries: [{query_range: query_range_a}]
        EOF
      end

      before do
        allow(described_class).to receive(:load_yaml_file) { YAML.load(sample_yaml) }
      end

      it 'parses to two metric groups with 2 and 1 metric respectively' 


      it 'provide group data' 


      it 'provides metrics data' 


      it 'provides query data' 

    end

    shared_examples 'required field' do |field_name|
      context "when #{field_name} is nil" do
        before do
          allow(described_class).to receive(:load_yaml_file) { YAML.load(field_missing) }
        end

        it 'throws parsing error' 

      end

      context "when #{field_name} are not specified" do
        before do
          allow(described_class).to receive(:load_yaml_file) { YAML.load(field_nil) }
        end

        it 'throws parsing error' 

      end
    end

    describe 'group required fields' do
      it_behaves_like 'required field', 'metrics' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
          EOF
        end
      end

      it_behaves_like 'required field', 'name' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group:
              priority: 1
              metrics: []
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - priority: 1
              metrics: []
          EOF
        end
      end

      it_behaves_like 'required field', 'priority' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority:
              metrics: []
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              metrics: []
          EOF
        end
      end
    end

    describe 'metrics fields parsing' do
      it_behaves_like 'required field', 'title' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title:
                required_metrics: []
                weight: 1
                queries: []
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - required_metrics: []
                weight: 1
                queries: []
          EOF
        end
      end

      it_behaves_like 'required field', 'required metrics' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                required_metrics:
                weight: 1
                queries: []
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                weight: 1
                queries: []
          EOF
        end
      end

      it_behaves_like 'required field', 'weight' do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                required_metrics: []
                weight:
                queries: []
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                required_metrics: []
                queries: []
          EOF
        end
      end

      it_behaves_like 'required field', :queries do
        let(:field_nil) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                required_metrics: []
                weight: 1
                queries:
          EOF
        end

        let(:field_missing) do
          <<-EOF.strip_heredoc
            - group: group_a
              priority: 1
              metrics:
              - title: title
                required_metrics: []
                weight: 1
          EOF
        end
      end
    end
  end
end

