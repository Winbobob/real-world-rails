require 'spec_helper'

describe Gitlab::Ci::Charts do
  context "yearchart" do
    let(:project) { create(:project) }
    let(:chart) { Gitlab::Ci::Charts::YearChart.new(project) }

    subject { chart.to }

    it 'goes until the end of the current month (including the whole last day of the month)' 


    it 'starts at the beginning of the current year' 

  end

  context "monthchart" do
    let(:project) { create(:project) }
    let(:chart) { Gitlab::Ci::Charts::MonthChart.new(project) }

    subject { chart.to }

    it 'includes the whole current day' 


    it 'starts one month ago' 

  end

  context "weekchart" do
    let(:project) { create(:project) }
    let(:chart) { Gitlab::Ci::Charts::WeekChart.new(project) }

    subject { chart.to }

    it 'includes the whole current day' 


    it 'starts one week ago' 

  end

  context "pipeline_times" do
    let(:project) { create(:project) }
    let(:chart) { Gitlab::Ci::Charts::PipelineTime.new(project) }

    subject { chart.pipeline_times }

    before do
      create(:ci_empty_pipeline, project: project, duration: 120)
    end

    it 'returns pipeline times in minutes' 


    it 'handles nil pipeline times' 

  end
end

