require 'spec_helper'

describe Boards::IssuesController do
  let(:project) { create(:project) }
  let(:board)   { create(:board, project: project) }
  let(:user)    { create(:user) }
  let(:guest)   { create(:user) }

  let(:planning)    { create(:label, project: project, name: 'Planning') }
  let(:development) { create(:label, project: project, name: 'Development') }

  let!(:list1) { create(:list, board: board, label: planning, position: 0) }
  let!(:list2) { create(:list, board: board, label: development, position: 1) }

  before do
    project.add_maintainer(user)
    project.add_guest(guest)
  end

  describe 'GET index', :request_store do
    let(:johndoe) { create(:user, avatar: fixture_file_upload(File.join('spec/fixtures/dk.png'))) }

    context 'with invalid board id' do
      it 'returns a not found 404 response' 

    end

    context 'when list id is present' do
      context 'with valid list id' do
        let(:group) { create(:group, :private, projects: [project]) }
        let(:group_board) { create(:board, group: group) }
        let!(:list3) { create(:list, board: group_board, label: development, position: 2) }
        let(:sub_group_1) { create(:group, :private, parent: group) }

        before do
          group.add_maintainer(user)
        end

        it 'returns issues that have the list label applied' 


        it 'avoids N+1 database queries' 


        it 'avoids N+1 database queries when adding a project', :request_store do
          create(:labeled_issue, project: project, labels: [development])
          control_count = ActiveRecord::QueryRecorder.new { list_issues(user: user, board: group_board, list: list3) }.count

          2.times do
            p = create(:project, group: group)
            create(:labeled_issue, project: p, labels: [development])
          end

          project_2 = create(:project, group: group)
          create(:labeled_issue, project: project_2, labels: [development], assignees: [johndoe])

          # because each issue without relative_position must be updated with
          # a different value, we have 8 extra queries per issue
          expect { list_issues(user: user, board: group_board, list: list3) }.not_to exceed_query_limit(control_count + (2 * 8 - 1))
        end

        it 'avoids N+1 database queries when adding a subgroup, project, and issue', :nested_groups do
          create(:project, group: sub_group_1)
          create(:labeled_issue, project: project, labels: [development])
          control_count = ActiveRecord::QueryRecorder.new { list_issues(user: user, board: group_board, list: list3) }.count
          project_2 = create(:project, group: group)

          2.times do
            p = create(:project, group: sub_group_1)
            create(:labeled_issue, project: p, labels: [development])
          end

          create(:labeled_issue, project: project_2, labels: [development], assignees: [johndoe])

          expect { list_issues(user: user, board: group_board, list: list3) }.not_to exceed_query_limit(control_count + (2 * 8 - 1))
        end
      end

      context 'with invalid list id' do
        it 'returns a not found 404 response' 

      end
    end

    context 'when list id is missing' do
      it 'returns opened issues without board labels applied' 

    end

    context 'with unauthorized user' do
      before do
        allow(Ability).to receive(:allowed?).and_call_original
        allow(Ability).to receive(:allowed?).with(user, :read_project, project).and_return(true)
        allow(Ability).to receive(:allowed?).with(user, :read_issue, project).and_return(false)
      end

      it 'returns a forbidden 403 response' 

    end

    def list_issues(user:, board:, list: nil)
      sign_in(user)

      params = {
        board_id: board.to_param,
        list_id: list.try(:to_param)
      }

      unless board.try(:parent)&.is_a?(Group)
        params[:namespace_id] = project.namespace.to_param
        params[:project_id] = project
      end

      get :index, params.compact
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'returns a successful 200 response' 


      it 'returns the created issue' 

    end

    context 'with invalid params' do
      context 'when title is nil' do
        it 'returns an unprocessable entity 422 response' 

      end

      context 'when list does not belongs to project board' do
        it 'returns a not found 404 response' 

      end

      context 'with invalid board id' do
        it 'returns a not found 404 response' 

      end

      context 'with invalid list id' do
        it 'returns a not found 404 response' 

      end
    end

    context 'with guest user' do
      context 'in open list' do
        it 'returns a successful 200 response' 

      end

      context 'in label list' do
        it 'returns a forbidden 403 response' 

      end
    end

    def create_issue(user:, board:, list:, title:)
      sign_in(user)

      post :create, board_id: board.to_param,
                    list_id: list.to_param,
                    issue: { title: title,  project_id: project.id },
                    format: :json
    end
  end

  describe 'PATCH update' do
    let!(:issue) { create(:labeled_issue, project: project, labels: [planning]) }

    context 'with valid params' do
      it 'returns a successful 200 response' 


      it 'moves issue to the desired list' 

    end

    context 'with invalid params' do
      it 'returns a unprocessable entity 422 response for invalid lists' 


      it 'returns a not found 404 response for invalid board id' 


      it 'returns a not found 404 response for invalid issue id' 

    end

    context 'with unauthorized user' do
      let(:guest) { create(:user) }

      before do
        project.add_guest(guest)
      end

      it 'returns a forbidden 403 response' 

    end

    def move(user:, board:, issue:, from_list_id:, to_list_id:)
      sign_in(user)

      patch :update, namespace_id: project.namespace.to_param,
                     project_id: project.id,
                     board_id: board.to_param,
                     id: issue.id,
                     from_list_id: from_list_id,
                     to_list_id: to_list_id,
                     format: :json
    end
  end
end

