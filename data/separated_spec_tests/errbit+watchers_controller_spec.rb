describe WatchersController, type: 'controller' do
  let(:user) { Fabricate(:user) }
  let(:problem) { Fabricate(:problem) }

  before(:each) { sign_in user }

  describe "#destroy" do
    let(:app) do
      a = Fabricate(:app)
      Fabricate(:user_watcher, app: a, user: user)
      a
    end

    context "successful watcher deletion" do
      let(:watcher) { app.watchers.first }

      before(:each) do
        delete :destroy, app_id: app.id, id: watcher.user.id.to_s
        problem.reload
      end

      it "should delete the watcher" 


      it "should redirect to app page" 

    end
  end

  describe "#update" do
    let(:app) { Fabricate(:app) }

    context "successful watcher update" do
      before(:each) do
        put :update, app_id: app.id, id: user.id.to_s
        problem.reload
      end

      it "should be watching" 


      it "should redirect to app page" 

    end
  end
end

