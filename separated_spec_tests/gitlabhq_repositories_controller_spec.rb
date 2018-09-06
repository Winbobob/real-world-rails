require "spec_helper"

describe Projects::RepositoriesController do
  let(:project) { create(:project, :repository) }

  describe "GET archive" do
    context 'as a guest' do
      it 'responds with redirect in correct format' 

    end

    context 'as a user' do
      let(:user) { create(:user) }

      before do
        project.add_developer(user)
        sign_in(user)
      end

      it "uses Gitlab::Workhorse" 


      it 'responds with redirect to the short name archive if fully qualified' 


      it 'handles legacy queries with no ref' 


      it 'handles legacy queries with the ref specified as ref in params' 


      it 'handles legacy queries with the ref specified as id in params' 


      it 'prioritizes the id param over the ref param when both are specified' 


      context "when the service raises an error" do
        before do
          allow(Gitlab::Workhorse).to receive(:send_git_archive).and_raise("Archive failed")
        end

        it "renders Not Found" 

      end
    end
  end
end

