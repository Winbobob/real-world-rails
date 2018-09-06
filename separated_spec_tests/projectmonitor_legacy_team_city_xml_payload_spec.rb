require 'spec_helper'
require Rails.root.join('spec', 'shared', 'xml_payload_examples')

describe LegacyTeamCityXmlPayload do
  let(:fixture_ext)     { "xml" }
  let(:fixture_dir)     { "teamcity_cradiator_xml_examples" }
  let(:fixture_content) { load_fixture(fixture_dir, fixture_file) }
  let(:build_content)   { load_fixture(fixture_dir, 'team_city_building.xml') }

  let(:project)           { create(:team_city_project) }
  let(:payload)           { LegacyTeamCityXmlPayload.new }
  let(:payload_processor) { PayloadProcessor.new(project_status_updater: StatusUpdater.new) }

  subject do
    payload_processor.process_payload(project: project, payload: payload)
    project
  end

  it_behaves_like "a XML payload"

  describe "project status" do
    context "when not currently building" do
      before { payload.status_content = fixture_content }

      context "when latest build is successful" do
        let(:fixture_file) { "success.xml" }

        it "doesn't add a duplicate of the existing status" 

      end
    end
  end

  describe "saving data" do
    let(:parsed_content) { Nokogiri::XML(fixture_content) }
    before { payload.status_content = fixture_content }

    describe "when build was successful" do
      let(:fixture_file)  { "success.xml" }

      describe '#latest_status' do
        subject { super().latest_status }
        it { is_expected.to be_success }
      end

      it "should return the link to the checkin" 


      it "should return the published date of the checkin" 

    end

    describe "when build failed" do
      let(:fixture_file) { "failure.xml" }

      describe '#latest_status' do
        subject { super().latest_status }
        it { is_expected.not_to be_success }
      end

      it "should return the link to the checkin" 


      it "should return the published date of the checkin" 

    end
  end

  describe "building status" do
    let(:build_content) { load_fixture(fixture_dir, "team_city_building.xml") }
    before { payload.build_status_content = build_content }

    it { is_expected.to be_building }

    it "should set building to false on the project when it is not building" 


    describe "#build_status_content" do
      let(:wrong_status_content) { "some non xml content" }
      context "invalid xml" do
        it 'should log error message' 

      end
    end
  end
end

