# frozen_string_literal: true

require 'rails_helper'

describe Gitlab::Prometheus::MetricGroup do
  describe '.common_metrics' do
    let!(:project_metric) { create(:prometheus_metric) }
    let!(:common_metric_group_a) { create(:prometheus_metric, :common, group: :aws_elb) }
    let!(:common_metric_group_b_q1) { create(:prometheus_metric, :common, group: :kubernetes) }
    let!(:common_metric_group_b_q2) { create(:prometheus_metric, :common, group: :kubernetes) }

    subject { described_class.common_metrics }

    it 'returns exactly two groups' 


    it 'returns exactly three metric queries' 

  end

  describe '.for_project' do
    let!(:other_project) { create(:project) }
    let!(:project_metric) { create(:prometheus_metric) }
    let!(:common_metric) { create(:prometheus_metric, :common, group: :aws_elb) }

    subject do
      described_class.for_project(other_project)
        .map(&:metrics).flatten
        .map(&:id)
    end

    it 'returns exactly one common metric' 

  end
end

