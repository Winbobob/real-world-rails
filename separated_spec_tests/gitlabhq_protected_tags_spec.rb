require 'spec_helper'

feature 'Protected Tags', :js do
  let(:user) { create(:user, :admin) }
  let(:project) { create(:project, :repository) }

  before do
    sign_in(user)
  end

  def set_protected_tag_name(tag_name)
    find(".js-protected-tag-select").click
    find(".dropdown-input-field").set(tag_name)
    click_on("Create wildcard #{tag_name}")
    find('.protected-tags-dropdown .dropdown-menu', visible: false)
  end

  describe "explicit protected tags" do
    it "allows creating explicit protected tags" 


    it "displays the last commit on the matching tag if it exists" 


    it "displays an error message if the named tag does not exist" 

  end

  describe "wildcard protected tags" do
    it "allows creating protected tags with a wildcard" 


    it "displays the number of matching tags" 


    it "displays all the tags matching the wildcard" 

  end

  describe "access control" do
    include_examples "protected tags > access control > CE"
  end
end

