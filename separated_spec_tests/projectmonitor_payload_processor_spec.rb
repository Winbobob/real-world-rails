require 'spec_helper'

describe PayloadProcessor do
  let(:project) { double(Project).as_null_object }
  let(:payload) { double(Payload).as_null_object }
  let(:status) { double(ProjectStatus).as_null_object }
  let(:project_status_updater) { double }
  let(:processor) { PayloadProcessor.new(project_status_updater: project_status_updater) }

  describe "#process" do
    context "when the payload's statuses can be parsed successfully" do
      before do
        allow(payload).to receive(:status_is_parseable?).and_return(true)
        allow(payload).to receive(:each_status).and_yield(status)
      end

      it "sets the project as online" 


      it "initializes a ProjectStatus for every payload status" 


      it "add a status to the project if the project does not have a matching status" 


      it "does not add the status to the project if a matching status exists" 


      context "with an invalid status" do
        let(:project) { create(:project) }
        let(:status) { build(:project_status, success: nil) }
        before {
          allow(payload).to receive(:building?).and_return(false)
          expect(status).to be_invalid
        }

        it "does not add the status to the project if it is invalid" 


        it "logs an error to the project if the status is invalid" 

      end
    end

    context "when the payload statuses are not parseable" do
      before { allow(payload).to receive(:status_is_parseable?).and_return(false) }

      it "skips accessing each status" 


      it "sets the project as offline" 

    end

    context "when payload has a parseable building_status" do
      before { allow(payload).to receive(:build_status_is_parseable?).and_return(true) }

      it "sets the project building status to that of the payload" 

    end

    context "when the payload build_status is not parseable" do
      before { allow(payload).to receive(:build_status_is_parseable?).and_return(false) }

      it "sets the project as not building" 

    end

  end

  describe "parse_url" do
    before do
      allow(payload).to receive(:status_is_parseable?).and_return(true)
      allow(payload).to receive(:parsed_url) { 'http://www.example.com' }
    end

    it "should set the project parsed_url" 

  end
end

