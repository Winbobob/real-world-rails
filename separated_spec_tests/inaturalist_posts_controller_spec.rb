require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController, "spam" do
  let(:spammer_content) {
    p = Post.make!(parent: User.make!)
    p.user.update_attributes(spammer: true)
    p
  }
  let(:flagged_content) {
    p = Post.make!(parent: User.make!)
    Flag.make!(flaggable: p, flag: Flag::SPAM)
    p
  }

  describe "show" do
    it "should render 403 when the owner is a spammer" 


    it "should render 403 when content is flagged as spam" 

  end

  describe "index" do
    it "should render atom" 

  end
end

describe PostsController, "creation" do
  describe "for user journal" do
    let( :user ) { User.make! }
    before do
      sign_in user
    end
    it "should work for user" 

    it "should not allow a user to post to another user's journal" 

  end
  describe "for projects" do
    let( :user ) { User.make! }
    before do
      sign_in user
    end
    it "should work for a curator" 

    it "should not work for a non-curator" 

  end
  describe "for sites" do
    let( :site ) { Site.make! }
    it "should work for a site admin" 

    it "should not work for a normal user" 

  end
end

describe PostsController, "update" do
  describe "for user" do
    let( :user ) { User.make! }
    before { sign_in user }
    it "should work for owner" 

    it "should not work for non-owner" 

  end
  describe "for project" do
    let( :user ) { User.make! }
    before { sign_in user }
    it "should work or a project curator" 

    it "should not work for a normal user" 

  end
  describe "for site" do
    it "should work or a site admin" 

    it "should not work for a normal user" 

  end
end

describe PostsController, "for projects" do
  let(:project) { Project.make! }
  describe "edit" do
    let(:post) { Post.make!(parent: project, user: project.user) }
    def expect_post_to_be_editable_by(user)
      sign_in user
      get :edit, id: post.id
      expect( response.response_code ).to eq 200
    end
    it "should work for post author" 

    it "should work for project managers" 

    it "should work for project curators" 

  end
end

describe PostsController, "show" do
  let(:user) { User.make! }
  it "should use the first image as the shareable_image_url regardless of quote style" 

end

