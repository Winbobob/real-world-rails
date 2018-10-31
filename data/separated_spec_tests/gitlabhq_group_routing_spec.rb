require 'spec_helper'

describe "Groups", "routing" do
  let(:group_path) { 'complex.group-namegit' }
  let!(:group) { create(:group, path: group_path) }

  it "to #show" 


  it "also supports nested groups" 


  it "also display group#show on the short path" 


  it "to #activity" 


  it "to #issues" 


  it "to #members" 


  it "to #labels" 


  it "to #milestones" 


  describe 'legacy redirection' do
    describe 'labels' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/labels", "/groups/complex.group-namegit/-/labels" do
        let(:resource) { create(:group, parent: group, path: 'labels') }
      end

      context 'when requesting JSON' do
        it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/labels.json", "/groups/complex.group-namegit/-/labels.json" do
          let(:resource) { create(:group, parent: group, path: 'labels') }
        end
      end
    end

    describe 'group_members' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/group_members", "/groups/complex.group-namegit/-/group_members" do
        let(:resource) { create(:group, parent: group, path: 'group_members') }
      end
    end

    describe 'avatar' do
      it 'routes to the avatars controller' 

    end

    describe 'milestones' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/milestones", "/groups/complex.group-namegit/-/milestones" do
        let(:resource) { create(:group, parent: group, path: 'milestones') }
      end

      context 'nested routes' do
        include RSpec::Rails::RequestExampleGroup

        let(:milestone) { create(:milestone, group: group) }

        it 'redirects the nested routes' 

      end

      context 'with a query string' do
        it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/milestones?hello=world", "/groups/complex.group-namegit/-/milestones?hello=world" do
          let(:resource) { create(:group, parent: group, path: 'milestones') }
        end

        it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/milestones?milestones=/milestones", "/groups/complex.group-namegit/-/milestones?milestones=/milestones" do
          let(:resource) { create(:group, parent: group, path: 'milestones') }
        end
      end
    end

    describe 'edit' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/edit", "/groups/complex.group-namegit/-/edit" do
        let(:resource) do
          pending('still rejected because of the wildcard reserved word')
          create(:group, parent: group, path: 'edit')
        end
      end
    end

    describe 'issues' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/issues", "/groups/complex.group-namegit/-/issues" do
        let(:resource) { create(:group, parent: group, path: 'issues') }
      end
    end

    describe 'merge_requests' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/merge_requests", "/groups/complex.group-namegit/-/merge_requests" do
        let(:resource) { create(:group, parent: group, path: 'merge_requests') }
      end
    end

    describe 'projects' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/projects", "/groups/complex.group-namegit/-/projects" do
        let(:resource) { create(:group, parent: group, path: 'projects') }
      end
    end

    describe 'activity' do
      it_behaves_like 'redirecting a legacy path', "/groups/complex.group-namegit/activity", "/groups/complex.group-namegit/-/activity" do
        let(:resource) { create(:group, parent: group, path: 'activity') }
      end

      it_behaves_like 'redirecting a legacy path', "/groups/activity/activity", "/groups/activity/-/activity" do
        let!(:parent) { create(:group, path: 'activity') }
        let(:resource) { create(:group, parent: parent, path: 'activity') }
      end
    end
  end
end

