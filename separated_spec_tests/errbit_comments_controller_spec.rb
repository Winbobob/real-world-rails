describe CommentsController, type: 'controller' do
  let(:app) { Fabricate(:app) }
  let(:err) { Fabricate(:err, problem: Fabricate(:problem, app: app, environment: "production")) }

  describe "POST /apps/:app_id/errs/:id/comments/create" do
    render_views

    before(:each) do
      sign_in Fabricate(:admin)
    end

    context "successful comment creation" do
      let(:problem) { Fabricate(:problem) }
      let(:user) { Fabricate(:user) }

      before(:each) do
        post :create, app_id: problem.app.id, problem_id: problem.id,
             comment: { body: "One test comment", user_id: user.id }
        problem.reload
      end

      it "should create the comment" 


      it "should redirect to problem page" 

    end
  end

  describe "DELETE /apps/:app_id/errs/:id/comments/:id/destroy" do
    render_views

    before(:each) do
      sign_in Fabricate(:admin)
    end

    context "successful comment deletion" do
      let(:problem) { Fabricate(:problem_with_comments) }
      let(:comment) { problem.reload.comments.first }

      before(:each) do
        delete :destroy, app_id: problem.app.id, problem_id: problem.id, id: comment.id.to_s
        problem.reload
      end

      it "should delete the comment" 


      it "should redirect to problem page" 

    end
  end
end

