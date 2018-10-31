require 'spec_helper'

describe API::V3::Boards do
  set(:user)        { create(:user) }
  set(:guest)       { create(:user) }
  set(:non_member)  { create(:user) }
  set(:project)    { create(:project, :public, creator_id: user.id, namespace: user.namespace ) }

  set(:dev_label) do
    create(:label, title: 'Development', color: '#FFAABB', project: project)
  end

  set(:test_label) do
    create(:label, title: 'Testing', color: '#FFAACC', project: project)
  end

  set(:dev_list) do
    create(:list, label: dev_label, position: 1)
  end

  set(:test_list) do
    create(:list, label: test_label, position: 2)
  end

  set(:board) do
    create(:board, project: project, lists: [dev_list, test_list])
  end

  before do
    project.add_reporter(user)
    project.add_guest(guest)
  end

  describe "GET /projects/:id/boards" do
    let(:base_url) { "/projects/#{project.id}/boards" }

    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated" do
      it "returns the project issue board" 

    end
  end

  describe "GET /projects/:id/boards/:board_id/lists" do
    let(:base_url) { "/projects/#{project.id}/boards/#{board.id}/lists" }

    it 'returns issue board lists' 


    it 'returns 404 if board not found' 

  end

  describe "DELETE /projects/:id/board/lists/:list_id" do
    let(:base_url) { "/projects/#{project.id}/boards/#{board.id}/lists" }

    it "rejects a non member from deleting a list" 


    it "rejects a user with guest role from deleting a list" 


    it "returns 404 error if list id not found" 


    context "when the user is project owner" do
      set(:owner) { create(:user) }

      before do
        project.update(namespace: owner.namespace)
      end

      it "deletes the list if an admin requests it" 

    end
  end
end

