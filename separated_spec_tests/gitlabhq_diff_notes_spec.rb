require 'spec_helper'

feature 'Commit diff', :js do
  include RepoHelpers

  let(:user)          { create(:user) }
  let(:project)       { create(:project, :public, :repository) }

  before do
    project.add_master(user)
    sign_in user
  end

  %w(inline parallel).each do |view|
    context "#{view} view" do
      before do
        visit project_commit_path(project, sample_commit.id, view: view)
      end

      it "adds comment to diff" 

    end
  end
end

