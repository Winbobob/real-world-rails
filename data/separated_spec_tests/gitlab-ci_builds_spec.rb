require 'spec_helper'

describe API::API do
  include ApiHelpers

  let(:runner) { FactoryGirl.create(:runner, tag_list: ["mysql", "ruby"]) }
  let(:project) { FactoryGirl.create(:project) }

  describe "Builds API for runners" do
    let(:shared_runner) { FactoryGirl.create(:runner, token: "SharedRunner") }
    let(:shared_project) { FactoryGirl.create(:project, name: "SharedProject") }

    before do
      FactoryGirl.create :runner_project, project_id: project.id, runner_id: runner.id
    end

    describe "POST /builds/register" do
      it "should start a build" 


      it "should return 404 error if no pending build found" 


      it "should return 404 error if no builds for specific runner" 


      it "should return 404 error if no builds for shared runner" 


      it "returns options" 


      it "returns variables" 


      it "returns variables for triggers" 

    end

    describe "PUT /builds/:id" do
      let(:commit) { FactoryGirl.create(:commit, project: project)}
      let(:build) { FactoryGirl.create(:build, commit: commit, runner_id: runner.id) }

      it "should update a running build" 


      it 'Should not override trace information when no trace is given' 

    end
  end
end

