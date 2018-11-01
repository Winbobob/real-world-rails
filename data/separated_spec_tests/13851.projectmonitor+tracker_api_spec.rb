require 'spec_helper'

describe TrackerApi, :type => :request do
  context "with the real service", vcr: {re_record_interval: 18.months} do
    subject { TrackerApi.new(project) }

    # ALERT: Always use a fake tracker project and a fake user with these tests
    # because they delete everything!
    let(:username) { "Test User" }
    let(:project) { create :project, tracker_project_id: 1059836, tracker_auth_token: "e955bd05b35741ce257eaeca935180c0" }
    let(:tracker_project) { PivotalTracker::Project.find project.tracker_project_id }

    before do
      PivotalTracker::Client.token = project.tracker_auth_token
      (1..3).each do |x|
        story = tracker_project.stories.create name: "Test #{x}",
          story_type: "feature",
          estimate: x,
          accepted_at: x.weeks.ago,
          current_state: "accepted",
          requested_by: username

        raise story.errors.first if story.errors.present?

        story = tracker_project.stories.create name: "Test (delivered) #{x}",
          story_type: "feature",
          estimate: 0,
          current_state: "delivered",
          requested_by: username
        raise story.errors.first if story.errors.present?
      end
      story = tracker_project.stories.create name: "Test (unstarted)",
        story_type: "feature",
        estimate: 0,
        current_state: "unstarted",
        requested_by: username

      raise story.errors.first if story.errors.present?
    end

    after do
      tracker_project.stories.all.each(&:delete)
    end

    context "last_ten_velocities" do
      it "should be the sum of the estimates of the stories from the 10 most recent iterations" 


      context "when the current iterations has unaccepted stories" do
        it "does not count the unaccepted stories" 

      end
    end

    context "stories_to_accept_count" do
      it "returns the number of delivered stories in the current iteration" 

    end

    context "open_stories_count" do
      it "returns the number of unstarted stories in the current iteration" 

    end
  end
end

