require 'spec_helper'

describe ApiV1::SearchController do
  describe "#results" do
    before do
      @user = login_as(:confirmed_user)
      @project = Factory.create :project, :user => @user, :permalink => 'important-project'
      @comment = Factory.create :comment, :project => @project
    end

    it "searches across all user's projects" 


    it "returns an empty array for blank searches" 


    it "rejects unauthorized search" 


    it "searches in a single project" 


    it "reject searching in unauthorized project" 


    def search_params(project_ids)
      ['important', { :retry_stale => true, :order => 'updated_at DESC',
        :with => { :project_id => project_ids },
        :classes => [Conversation, Task, TaskList, Page],
        :page => nil}]
    end
  end
end

