require 'spec_helper'

describe ProjectsHelper, :type => :helper do

  describe '#project_types' do
    subject { helper.project_types }
    it do
      is_expected.to eq([['', ''],
                 ['Cruise Control Project', 'CruiseControlProject'],
                 ['Jenkins Project', 'JenkinsProject'],
                 ['Semaphore Project', 'SemaphoreProject'],
                 ['Team City Project', 'TeamCityRestProject'],
                 ['Team City Project (version <= 6)', 'TeamCityProject'],
                 ['Travis Project', 'TravisProject'],
                 ['Travis Pro Project', 'TravisProProject'],
                 ['Tddium Project', 'TddiumProject'],
                 ['CircleCi Project', 'CircleCiProject'],
                 ['Concourse Project (version 1.x)', 'ConcourseV1Project'],
                 ['Concourse Project', 'ConcourseProject'],
                 ['Codeship Project', 'CodeshipProject']])
    end
  end

  describe "#project_webhooks_url" do
    subject { helper.project_webhooks_url(project) }

    context "when the project has a guid" do
      let(:project) { build(:project) }
      before { project.save }
      it { is_expected.to include project.guid }
    end

    context "when the project lacks a guid" do
      let!(:project) { create(:project) }
      before { project.tap {|p| p.guid = nil}.save! }

      it "should generate a guid" 

    end
  end

  describe '#project_last_status_text' do
    subject { helper.project_last_status_text(project) }

    context "when the project have a payload" do
      let(:payload) { PayloadLogEntry.new(status: "status") }
      let(:project) { create(:project, payload_log_entries: [payload]) }

      context "when the project is enabled" do
        it { is_expected.to eq('Status') }

        context "but the project's latest payload doesn't have status" do
          let(:payload) { PayloadLogEntry.new(status: nil) }
          it { is_expected.to eq('Unknown Status') }
        end
      end
      context "when the project is disabled" do
        let(:project) { create(:project, enabled: false, payload_log_entries: [payload]) }
        it { is_expected.to eq('Disabled') }
      end
    end

    context "when the project doesn't have payloads" do
      let(:project) { create(:project) }
      it { is_expected.to eq('None') }
    end
  end

  describe "#project_last_status" do
    let(:payload) { PayloadLogEntry.new(status: "status") }
    let(:payload_log_entries) { [payload] }
    let(:enabled) { nil }
    let(:project) { create(:project, payload_log_entries: payload_log_entries, enabled: enabled) }

    context "when there is payload log entries" do
      context "when the project is enabled" do
        let(:enabled) { true }

        it "should return a link to the latest status" 

      end

      context "when the project is disabled" do
        let(:enabled) { false }

        it "should return a paragraph selector with diabled as the text" 

      end
    end

    context "when there are no payload log entries" do
      let(:payload_log_entries) { [] }

      it "should return the text None" 

    end
  end

  describe "#project_specific_attributes_for" do
    subject { helper.project_specific_attributes_for(JenkinsProject) }

    it "returns a hash with an key for each specific attribute" 


    describe "overriden field labels" do
      subject { helper.project_specific_attributes_for(ConcourseV1Project) }

      it "returns the new label text for the field" 

    end

    describe "field tooltip" do
      it "returns the tooltip for the field, if present" 


      it "is nil when there is no help block" 

    end
  end

  describe '#build_setup_instructions_for' do
    it 'returns the contents of the file in docs/build_setup with the name of the passed project type' 


    it 'should return a Kramdowned empty string when there is no associated file' 

  end
end

