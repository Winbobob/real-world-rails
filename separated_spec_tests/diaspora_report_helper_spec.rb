# frozen_string_literal: true

describe ReportHelper, type: :helper do
  before do
    @user = bob
    @post = @user.post(:status_message, text: "hello", to: @user.aspects.first.id)
    @comment = @user.comment!(@post, "welcome")

    @post_report = @user.reports.create(
      item_id: @post.id, item_type: "Post",
      text: "offensive content"
    )
    @comment_report = @user.reports.create(
      item_id: @comment.id, item_type: "Comment",
      text: "offensive content"
    )
  end

  describe "#report_content" do
    it "contains a link to the post" 

    it "contains an anchor to the comment" 

  end

  describe "#unreviewed_reports_count" do
    it "returns the number of unreviewed reports" 

  end
end

