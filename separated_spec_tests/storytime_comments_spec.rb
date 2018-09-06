require 'spec_helper'

describe "Comments", type: :feature do
  before do
    # setup_site
    login
  end

  it "lists comments on a post" 


  it "creates a comment" 


  it "deletes a comment", js: true do
    post = FactoryGirl.create(:post, site: @current_site, blog: @current_site.blogs.first)
    other_persons_comment = FactoryGirl.create(:comment, post: post, site: @current_site)
    comment_to_delete = FactoryGirl.create(:comment, post: post, user: current_user, site: @current_site)

    visit url_for([post, only_path: true])

    expect(page).to have_content(other_persons_comment.content)

    expect(page).to have_content(comment_to_delete.content)
    click_link "delete_comment_#{comment_to_delete.id}"

    expect(page).to_not have_content(comment_to_delete.content)

    expect{ comment_to_delete.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end

end

