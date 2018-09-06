require 'webmock/rspec'
require 'rails_helper'
require 'statistics_calculations'

RSpec.describe StatisticsCalculations do
  describe 'get_latest_updated' do
    let(:package_1) { create(:package) }
    let(:package_2) { create(:package, name: 'my_package') }
    let(:package_3) { create(:package) }
    let(:project_without_package) { create(:project) }

    before do
      # Create all objects and their relations with the correct timestamps
      Timecop.freeze(30.seconds.ago) { package_1 }
      Timecop.freeze(1.minute.ago)  { package_2 }
      Timecop.freeze(2.minutes.ago) { package_3 }
      Timecop.freeze(1.minute.ago)  { project_without_package }
    end

    def project_result_for(project)
      [project.updated_at, project.name, :project]
    end

    def package_result_for(package)
      [package.updated_at, :package, package.name, package.project.name]
    end

    context 'when called with no parameters' do
      subject { StatisticsCalculations.get_latest_updated }

      it 'returns all projects available' 


      it 'returns all packages available' 

    end

    context 'when limit n is given' do
      subject { StatisticsCalculations.get_latest_updated(3) }

      it 'returns the newest n packages and projects' 

    end

    context 'when timelimit is given' do
      subject { StatisticsCalculations.get_latest_updated(10, 65.seconds.ago) }

      it { expect(subject.length).to eq(5) }

      it 'returns all packages and projects updated after the timelimit' 

    end

    context 'when project filter is given' do
      subject { StatisticsCalculations.get_latest_updated(10, 125.seconds.ago, 'my_proj') }

      before do
        # We need to be able to identify the project
        package_3.project.update_attributes!(name: 'my_project')
      end

      it { expect(subject.length).to eq(2) }

      it 'returns all packages that have a matching project' 


      it 'returns projects that match the filter' 

    end

    context 'when package filter is given' do
      subject { StatisticsCalculations.get_latest_updated(10, 5.minutes.ago, '.*', 'my_pack') }

      it { expect(subject.length).to eq(5) }

      it 'returns only packages that match the package filter' 


      it 'returns all projects' 

    end
  end
end

