require 'spec_helper'

describe Groups::MilestonesController do
  let(:group) { create(:group) }
  let!(:project) { create(:project, group: group) }
  let!(:project2) { create(:project, group: group) }
  let(:user)    { create(:user) }
  let(:title) { '肯定不是中文的问题' }
  let(:milestone) do
    project_milestone = create(:milestone, project: project)

    GroupMilestone.build(
      group,
      [project],
      project_milestone.title
    )
  end
  let(:milestone_path) { group_milestone_path(group, milestone.safe_title, title: milestone.title) }

  let(:milestone_params) do
    {
      title: title,
      start_date: Date.today,
      due_date: 1.month.from_now.to_date
    }
  end

  before do
    sign_in(user)
    group.add_owner(user)
    project.add_maintainer(user)
  end

  describe '#index' do
    it 'shows group milestones page' 


    context 'as JSON' do
      let!(:milestone) { create(:milestone, group: group, title: 'group milestone') }
      let!(:legacy_milestone1) { create(:milestone, project: project, title: 'legacy') }
      let!(:legacy_milestone2) { create(:milestone, project: project2, title: 'legacy') }

      it 'lists legacy group milestones and group milestones' 

    end
  end

  describe '#show' do
    let(:milestone1) { create(:milestone, project: project, title: 'legacy') }
    let(:milestone2) { create(:milestone, project: project, title: 'legacy') }
    let(:group_milestone) { create(:milestone, group: group) }

    context 'when there is a title parameter' do
      it 'searchs for a legacy group milestone' 

    end

    context 'when there is not a title parameter' do
      it 'searchs for a group milestone' 

    end
  end

  it_behaves_like 'milestone tabs'

  describe "#create" do
    it "creates group milestone with Chinese title" 

  end

  describe "#update" do
    let(:milestone) { create(:milestone, group: group) }

    it "updates group milestone" 


    context "legacy group milestones" do
      let!(:milestone1) { create(:milestone, project: project, title: 'legacy milestone', description: "old description") }
      let!(:milestone2) { create(:milestone, project: project2, title: 'legacy milestone', description: "old description") }

      it "updates only group milestones state" 

    end
  end

  describe "#destroy" do
    let(:milestone) { create(:milestone, group: group) }

    it "removes milestone" 

  end

  describe '#ensure_canonical_path' do
    before do
      sign_in(user)
    end

    context 'for a GET request' do
      context 'when requesting the canonical path' do
        context 'non-show path' do
          context 'with exactly matching casing' do
            it 'does not redirect' 

          end

          context 'with different casing' do
            it 'redirects to the correct casing' 

          end
        end

        context 'show path' do
          context 'with exactly matching casing' do
            it 'does not redirect' 

          end

          context 'with different casing' do
            it 'redirects to the correct casing' 

          end
        end
      end

      context 'when requesting a redirected path' do
        let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }

        it 'redirects to the canonical path' 


        context 'when the old group path is a substring of the scheme or host' do
          let(:redirect_route) { group.redirect_routes.create(path: 'http') }

          it 'does not modify the requested host' 

        end

        context 'when the old group path is substring of groups' do
          # I.e. /groups/oups should not become /grfoo/oups
          let(:redirect_route) { group.redirect_routes.create(path: 'oups') }

          it 'does not modify the /groups part of the path' 

        end

        context 'when the old group path is substring of groups plus the new path' do
          # I.e. /groups/oups/oup should not become /grfoos
          let(:redirect_route) { group.redirect_routes.create(path: 'oups/oup') }

          it 'does not modify the /groups part of the path' 

        end
      end
    end
  end

  context 'for a non-GET request' do
    context 'when requesting the canonical path with different casing' do
      it 'does not 404' 


      it 'does not redirect to the correct casing' 

    end

    context 'when requesting a redirected path' do
      let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }

      it 'returns not found' 

    end
  end

  def group_moved_message(redirect_route, group)
    "Group '#{redirect_route.path}' was moved to '#{group.full_path}'. Please update any links and bookmarks that may still have the old path."
  end
end

