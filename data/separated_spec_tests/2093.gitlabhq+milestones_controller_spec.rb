require 'spec_helper'

describe Projects::MilestonesController do
  let(:project) { create(:project) }
  let(:user)    { create(:user) }
  let(:milestone) { create(:milestone, project: project) }
  let(:issue) { create(:issue, project: project, milestone: milestone) }
  let!(:label) { create(:label, project: project, title: 'Issue Label', issues: [issue]) }
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project, milestone: milestone) }
  let(:milestone_path) { namespace_project_milestone_path }

  before do
    sign_in(user)
    project.add_maintainer(user)
    controller.instance_variable_set(:@project, project)
  end

  it_behaves_like 'milestone tabs'

  describe "#show" do
    render_views

    def view_milestone(options = {})
      params = { namespace_id: project.namespace.id, project_id: project.id, id: milestone.iid }
      get :show, params.merge(options)
    end

    it 'shows milestone page' 


    it 'returns milestone json' 

  end

  describe "#index" do
    context "as html" do
      def render_index(project:, page:)
        get :index, namespace_id: project.namespace.id,
                    project_id: project.id,
                    page: page
      end

      it "queries only projects milestones" 


      it 'renders paginated milestones without missing or duplicates' 

    end

    context "as json" do
      let!(:group) { create(:group, :public) }
      let!(:group_milestone) { create(:milestone, group: group) }

      context 'with a single group ancestor' do
        before do
          project.update(namespace: group)
          get :index, namespace_id: project.namespace.id, project_id: project.id, format: :json
        end

        it "queries projects milestones and groups milestones" 

      end

      context 'with nested groups', :nested_groups do
        let!(:subgroup) { create(:group, :public, parent: group) }
        let!(:subgroup_milestone) { create(:milestone, group: subgroup) }

        before do
          project.update(namespace: subgroup)
          get :index, namespace_id: project.namespace.id, project_id: project.id, format: :json
        end

        it "queries projects milestones and all ancestors milestones" 

      end
    end
  end

  describe "#destroy" do
    it "removes milestone" 

  end

  describe '#promote' do
    context 'promotion succeeds' do
      before do
        group = create(:group)
        group.add_developer(user)
        milestone.project.update(namespace: group)
      end

      it 'shows group milestone' 


      it 'renders milestone name without parsing it as HTML' 

    end

    context 'promotion fails' do
      it 'shows project milestone' 

    end
  end
end

