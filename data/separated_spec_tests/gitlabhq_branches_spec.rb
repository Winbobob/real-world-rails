require 'spec_helper'
require 'mime/types'

describe API::V3::Branches do
  set(:user) { create(:user) }
  set(:user2) { create(:user) }
  set(:project) { create(:project, :repository, creator: user) }
  set(:master) { create(:project_member, :master, user: user, project: project) }
  set(:guest) { create(:project_member, :guest, user: user2, project: project) }
  let!(:branch_name) { 'feature' }
  let!(:branch_sha) { '0b4bc9a49b562e85de7cc9e834518ea6828729b9' }
  let!(:branch_with_dot) { CreateBranchService.new(project, user).execute("with.1.2.3", "master") }

  describe "GET /projects/:id/repository/branches" do
    it "returns an array of project branches" 

  end

  describe "DELETE /projects/:id/repository/branches/:branch" do
    before do
      allow_any_instance_of(Repository).to receive(:rm_branch).and_return(true)
    end

    it "removes branch" 


    it "removes a branch with dots in the branch name" 


    it 'returns 404 if branch not exists' 

  end

  describe "DELETE /projects/:id/repository/merged_branches" do
    before do
      allow_any_instance_of(Repository).to receive(:rm_branch).and_return(true)
    end

    it 'returns 200' 


    it 'returns a 403 error if guest' 

  end

  describe "POST /projects/:id/repository/branches" do
    it "creates a new branch" 


    it "denies for user without push access" 


    it 'returns 400 if branch name is invalid' 


    it 'returns 400 if branch already exists' 


    it 'returns 400 if ref name is invalid' 

  end
end

