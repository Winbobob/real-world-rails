describe UserDestroy do
  let(:app) do
    Fabricate(
      :app,
      watchers: [
        Fabricate.build(:user_watcher, user: user)
      ])
  end

  describe "#destroy" do
    let!(:user) { Fabricate(:user) }
    it 'should delete user' 


    it 'should delete watcher' 

  end
end

