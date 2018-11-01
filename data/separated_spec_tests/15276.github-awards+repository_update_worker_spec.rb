require 'rails_helper'

describe RepositoryUpdateWorker do
  
  let(:github_result) { JSON.parse(File.read("spec/fixtures/github/repo.json")) }
  let(:user) { FactoryGirl.create(:user) }
  
  describe "perform" do
    context "new repo" do
      it "creates repo" 

    end
    
    context "repo not found on github" do
      it "ignores repo" 

    end
  end
  
  describe "update_repo" do
    it "updates repo" 

    
    it "updates user rank" 

  end
end

