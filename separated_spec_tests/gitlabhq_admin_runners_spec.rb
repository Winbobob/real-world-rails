require 'spec_helper'

describe "Admin Runners" do
  include StubENV

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
    sign_in(create(:admin))
  end

  describe "Runners page" do
    let(:pipeline) { create(:ci_pipeline) }

    context "when there are runners" do
      before do
        runner = FactoryBot.create(:ci_runner, contacted_at: Time.now)
        FactoryBot.create(:ci_build, pipeline: pipeline, runner_id: runner.id)
        visit admin_runners_path
      end

      it 'has all necessary texts' 


      describe 'search' do
        before do
          FactoryBot.create :ci_runner, description: 'runner-foo'
          FactoryBot.create :ci_runner, description: 'runner-bar'
        end

        it 'shows correct runner when description matches' 


        it 'shows no runner when description does not match' 

      end
    end

    context "when there are no runners" do
      before do
        visit admin_runners_path
      end

      it 'has all necessary texts including no runner message' 

    end

    context 'group runner' do
      let(:group) { create(:group) }
      let!(:runner) { create(:ci_runner, groups: [group], runner_type: :group_type) }

      it 'shows the label and does not show the project count' 

    end

    context 'shared runner' do
      it 'shows the label and does not show the project count' 

    end

    context 'specific runner' do
      it 'shows the label and the project count' 

    end
  end

  describe "Runner show page" do
    let(:runner) { FactoryBot.create :ci_runner }

    before do
      @project1 = FactoryBot.create(:project)
      @project2 = FactoryBot.create(:project)
      visit admin_runner_path(runner)
    end

    describe 'runner info' do
      it { expect(find_field('runner_token').value).to eq runner.token }
    end

    describe 'projects' do
      it 'contains project names' 

    end

    describe 'search' do
      before do
        search_form = find('#runner-projects-search')
        search_form.fill_in 'search', with: @project1.name
        search_form.click_button 'Search'
      end

      it 'contains name of correct project' 

    end

    describe 'enable/create' do
      shared_examples 'assignable runner' do
        it 'enables a runner for a project' 

      end

      context 'with specific runner' do
        before do
          @project1.runners << runner
          visit admin_runner_path(runner)
        end

        it_behaves_like 'assignable runner'
      end

      context 'with locked runner' do
        before do
          runner.update(locked: true)
          @project1.runners << runner
          visit admin_runner_path(runner)
        end

        it_behaves_like 'assignable runner'
      end

      context 'with shared runner' do
        before do
          @project1.destroy
          runner.update(is_shared: true)
          visit admin_runner_path(runner)
        end

        it_behaves_like 'assignable runner'
      end
    end

    describe 'disable/destroy' do
      before do
        @project1.runners << runner
        visit admin_runner_path(runner)
      end

      it 'enables specific runner for project' 

    end
  end

  describe 'runners registration token' do
    let!(:token) { Gitlab::CurrentSettings.runners_registration_token }

    before do
      visit admin_runners_path
    end

    it 'has a registration token' 


    describe 'reload registration token' do
      let(:page_token) { find('#registration_token').text }

      before do
        click_button 'Reset runners registration token'
      end

      it 'changes registration token' 

    end
  end
end

