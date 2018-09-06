require 'spec_helper'

describe "Dashboard Feed"  do
  describe "GET /" do
    let!(:user) { create(:user, name: "Jonh") }

    context "projects atom feed via personal access token" do
      it "renders projects atom feed" 

    end

    context "projects atom feed via RSS token" do
      it "renders projects atom feed" 

    end

    context 'feed content' do
      let(:project) { create(:project) }
      let(:issue) { create(:issue, project: project, author: user, description: '') }
      let(:note) { create(:note, noteable: issue, author: user, note: 'Bug confirmed', project: project) }

      before do
        project.add_master(user)
        issue_event(issue, user)
        note_event(note, user)
        visit dashboard_projects_path(:atom, rss_token: user.rss_token)
      end

      it "has issue opened event" 


      it "has issue comment event" 

    end
  end

  def issue_event(issue, user)
    EventCreateService.new.open_issue(issue, user)
  end

  def note_event(note, user)
    EventCreateService.new.leave_note(note, user)
  end
end

