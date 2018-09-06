require 'spec_helper'

describe StatusController, :type => :controller do
  describe "#create" do

    context "Travis project" do
      let!(:project) { create(:travis_project) }
      let(:successful_payload) do
        URI.encode(open('spec/fixtures/travis_examples/success.json').read.gsub("4314974", "4219108"))
      end
      let(:failure_payload) do
        URI.encode(open('spec/fixtures/travis_examples/failure.json').read)
      end
      let(:on_start_payload) do
        URI.encode(open('spec/fixtures/travis_examples/created.json').read)
      end

      subject { post :create, project_id: project.guid, payload: successful_payload }

      it "should create a new status" 


      it "should log a payload log" 


      it "doesn't create new status recores for 'on_start' notifications" 


      it "also creates a new status when it receives successful notification after failure" 


      it "creates only one new status" 


      it "should have all the attributes" 


      it "should update last_refreshed_at" 


      it "should update parsed_url" 

    end

    context "Jenkins project" do
      let!(:project) { create(:project) }
      let(:build_id) { 7 }
      let(:build_url) { "job/projectmonitor_ci_test/#{build_id}/" }
      let(:parsed_url) { "job/projectmonitor_ci_test/" }
      let(:payload) do
        %Q{{"name":"projectmonitor_ci_test",
        "url":"job/projectmonitor_ci_test/",
        "build":{"number":#{build_id},"phase":"FINISHED",
        "status":"FAILURE",
        "url":"#{build_url}"}}}
      end

      shared_examples_for "a Jenkins webhook build" do
        it "should create a new status" 


        it "creates only one new status" 


        it "should have all the attributes" 


        it "should update parsed_url" 

      end

      context "payload sent as raw post data (deprecated)" do
        subject do
          request.env['RAW_POST_DATA'] = payload
          post :create, project_id: project.guid
        end

        it_behaves_like "a Jenkins webhook build"
      end

      context "payload sent as params" do
        subject do
          post :create, JSON.parse(payload).merge(project_id: project.guid)
        end

        it_behaves_like "a Jenkins webhook build"
      end
    end

    context "Codeship project" do
      let!(:project) { create(:codeship_project, webhooks_enabled: true) }
      let(:payload)  { JSON.parse(open('spec/fixtures/codeship_examples/webhook.json').read) }
      subject { post :create, payload.merge(project_id: project.guid) }

      it "should create a new status" 


      it "creates only one new status" 


      it "should have all the attributes" 

    end

    context "TeamCity Rest project" do
      let!(:project) { create(:team_city_rest_project) }
      let(:payload)  { JSON.parse(open('spec/fixtures/teamcity_json_examples/webhook.json').read) }

      subject do
        post :create, project_id: project.guid, build: payload
      end

      it "should create a new status" 


      it "creates only one new status" 


      it "should have all the attributes" 


      it "should update parsed_url" 

    end

    context 'when processing the payload succeeded' do
      let(:project) { build(:jenkins_project, guid: '1')}

      let(:payload) do
        {'name'  => 'projectmonitor_ci_test',
         'url'    => 'job/projectmonitor_ci_test/',
         'build'  => {
           'number' => 7,
           'phase'  => 'FINISHED',
           'status' => 'FAILURE',
           'url'    => 'job/projectmonitor_ci_test/7/'}}
      end

      before do
        allow(Project).to receive(:find_by_guid).and_return(project)
      end

      after do
        post :create, payload.merge(project_id: project.guid)
      end

      it 'should set last_refreshed_at' 


      it 'should save the project' 

    end

    context 'when processing the payload failed' do

      let(:project) { build(:jenkins_project, guid: '1')}

      before do
        allow(Project).to receive(:find_by_guid).and_return(project)
      end

      it "should not update the project's last_refreshed_at date" 


    end

    context "when a project isn't found" do
      it "should return a 404" 

    end

  end
end

