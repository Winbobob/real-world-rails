require 'spec_helper'

describe "Dashboard Issues Feed"  do
  describe "GET /issues" do
    let!(:user)     { create(:user, email: 'private1@example.com', public_email: 'public1@example.com') }
    let!(:assignee) { create(:user, email: 'private2@example.com', public_email: 'public2@example.com') }
    let!(:project1) { create(:project) }
    let!(:project2) { create(:project) }

    before do
      project1.add_master(user)
      project2.add_master(user)
    end

    describe "atom feed" do
      it "returns 400 if no filter is used" 


      it "renders atom feed via personal access token" 


      it "renders atom feed via RSS token" 


      it "renders atom feed with url parameters" 


      context "issue with basic fields" do
        let!(:issue2) { create(:issue, author: user, assignees: [assignee], project: project2, description: 'test desc') }

        it "renders issue fields" 

      end

      context "issue with label and milestone" do
        let!(:milestone1) { create(:milestone, project: project1, title: 'v1') }
        let!(:label1)     { create(:label, project: project1, title: 'label1') }
        let!(:issue1)     { create(:issue, author: user, assignees: [assignee], project: project1, milestone: milestone1) }

        before do
          issue1.labels << label1
        end

        it "renders issue label and milestone info" 

      end
    end
  end
end

