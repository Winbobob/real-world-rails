require 'spec_helper'

describe ProjectMonitorHelper, :type => :helper do
  before do
    @status = double(ProjectStatus, published_at: publish_time)
    @project = double(Project, status: @status)
  end

  describe "#static_status_messages_for" do
    def publish_time
      Time.parse('Fri May 28 17:27:11 -0700 2010')
    end

    context "when the project's status published_at & red_since is nil" do
      before do
        @status = double(ProjectStatus, published_at: nil)
        @project = double(Project, status: @status, red_since: nil)
        allow(@project).to receive(:online?).and_return(true)
        allow(@project).to receive(:failure?).and_return(true)
        allow(@project).to receive(:red_build_count).and_return(2)
      end

      it "acts as though the build were today" 

    end

    context "when the project is online" do
      before do
        allow(@project).to receive(:online?).and_return(true)
        allow(@project).to receive(:failure?).and_return(false)
      end

      context "when the project isn't red" do
        it "should include the last built date" 

      end

      context "when the project is red" do
        before do
          @red_since_time = @status.published_at - 2.days
          allow(@project).to receive(:failure?).and_return(true)
          allow(@project).to receive(:red_build_count).and_return(20)
          allow(@project).to receive(:red_since).and_return(@red_since_time)
        end

        it "should include the oldest continuous failure date" 

      end
    end

    context "when the project is inaccessible" do
      before do
        allow(@project).to receive(:online?).and_return(false)
      end

      it "should an appropriate message" 

    end
  end
end

