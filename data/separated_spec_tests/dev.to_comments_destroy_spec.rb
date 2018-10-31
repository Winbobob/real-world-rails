require "rails_helper"

RSpec.describe "CommentsDestroy", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }

  before do
    sign_in user
  end

  describe "GET /:username/comment/:id_code/delete_confirm" do
    it "renders the confirmation message" 

  end

  describe "DELETE /comments/:id" do
    context "when comment has no children" do
      it "destroys the comment" 

    end

    context "when comment has children" do
      let(:parent_comment) { create(:comment, user_id: user.id, commentable_id: article.id) }
      let(:child_comment) do
        create(
          :comment,
          user_id: user.id,
          commentable_id: article.id,
          parent_id: parent_comment.id,
        )
      end

      before do
        parent_comment
        child_comment
        delete "/comments/#{parent_comment.id}"
      end

      it "marks the comment as deleted" 


      it "renders [deleted]" 

    end
  end
end

