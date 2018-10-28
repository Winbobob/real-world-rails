# rubocop:disable RSpec/MultipleExpectations
require "rails_helper"

describe "articles/show", type: :view do
  let(:user1) { create(:user) }
  let(:article1) { create(:article, user_id: user1.id, show_comments: true) }
  let(:helper) { Class.new { extend CommentsHelper } }

  before do
    assign(:user, user1)
    assign(:article, article1.decorate)
    assign(:comment, Comment.new)
    without_partial_double_verification do
      allow(view).to receive(:internal_navigation?).and_return(params[:i] == "i")
    end
  end

  def create_comment(parent_id = nil)
    create(
      :comment,
      user_id: user1.id,
      parent_id: parent_id || nil,
      commentable_id: article1.id,
      commentable_type: "Article",
    )
  end

  it "shows user title of the article" 


  it "shows user tags" 


  it "shows user content of the article" 


  it "shows user new comment box" 


  # rubocop:disable RSpec/ExampleLength
  it "shows user comments of the article" 

  # rubocop:enable RSpec/ExampleLength
end

# note fully implemented yet
# require 'approvals/rspec'
#
# describe 'articles/index', type: :view do
#   it 'works' do
#     assign(:featured_story, Article.new)
#     render
#     verify(format: :html) { rendered }
#   end
#
# end
# rubocop:enable RSpec/MultipleExpectations

