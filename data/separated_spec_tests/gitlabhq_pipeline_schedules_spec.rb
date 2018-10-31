require 'spec_helper'

describe API::PipelineSchedules do
  set(:developer) { create(:user) }
  set(:user) { create(:user) }
  set(:project) { create(:project, :repository, public_builds: false) }

  before do
    project.add_developer(developer)
  end

  describe 'GET /projects/:id/pipeline_schedules' do
    context 'authenticated user with valid permissions' do
      let(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: developer) }

      before do
        pipeline_schedule.pipelines << build(:ci_pipeline, project: project)
      end

      def create_pipeline_schedules(count)
        create_list(:ci_pipeline_schedule, count, project: project)
          .each do |pipeline_schedule|
          create(:user).tap do |user|
            project.add_developer(user)
            pipeline_schedule.update_attributes(owner: user)
          end
          pipeline_schedule.pipelines << build(:ci_pipeline, project: project)
        end
      end

      it 'returns list of pipeline_schedules' 


      it 'avoids N + 1 queries' 


      %w[active inactive].each do |target|
        context "when scope is #{target}" do
          before do
            create(:ci_pipeline_schedule, project: project, active: active?(target))
          end

          it 'returns matched pipeline schedules' 

        end

        def active?(str)
          (str == 'active') ? true : false
        end
      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not return pipeline_schedules list' 

    end

    context 'unauthenticated user' do
      it 'does not return pipeline_schedules list' 

    end
  end

  describe 'GET /projects/:id/pipeline_schedules/:pipeline_schedule_id' do
    let(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: developer) }

    before do
      pipeline_schedule.pipelines << build(:ci_pipeline, project: project)
    end

    context 'authenticated user with valid permissions' do
      it 'returns pipeline_schedule details' 


      it 'responds with 404 Not Found if requesting non-existing pipeline_schedule' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not return pipeline_schedules list' 

    end

    context 'authenticated user with insufficient permissions' do
      before do
        project.add_guest(user)
      end

      it 'does not return pipeline_schedules list' 

    end

    context 'unauthenticated user' do
      it 'does not return pipeline_schedules list' 

    end
  end

  describe 'POST /projects/:id/pipeline_schedules' do
    let(:params) { attributes_for(:ci_pipeline_schedule) }

    context 'authenticated user with valid permissions' do
      context 'with required parameters' do
        it 'creates pipeline_schedule' 

      end

      context 'without required parameters' do
        it 'does not create pipeline_schedule' 

      end

      context 'when cron has validation error' do
        it 'does not create pipeline_schedule' 

      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not create pipeline_schedule' 

    end

    context 'unauthenticated user' do
      it 'does not create pipeline_schedule' 

    end
  end

  describe 'PUT /projects/:id/pipeline_schedules/:pipeline_schedule_id' do
    let(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    context 'authenticated user with valid permissions' do
      it 'updates cron' 


      context 'when cron has validation error' do
        it 'does not update pipeline_schedule' 

      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not update pipeline_schedule' 

    end

    context 'unauthenticated user' do
      it 'does not update pipeline_schedule' 

    end
  end

  describe 'POST /projects/:id/pipeline_schedules/:pipeline_schedule_id/take_ownership' do
    let(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    context 'authenticated user with valid permissions' do
      it 'updates owner' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not update owner' 

    end

    context 'unauthenticated user' do
      it 'does not update owner' 

    end
  end

  describe 'DELETE /projects/:id/pipeline_schedules/:pipeline_schedule_id' do
    let(:master) { create(:user) }

    let!(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    before do
      project.add_master(master)
    end

    context 'authenticated user with valid permissions' do
      it 'deletes pipeline_schedule' 


      it 'responds with 404 Not Found if requesting non-existing pipeline_schedule' 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/pipeline_schedules/#{pipeline_schedule.id}", master) }
      end
    end

    context 'authenticated user with invalid permissions' do
      let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: master) }

      it 'does not delete pipeline_schedule' 

    end

    context 'unauthenticated user' do
      it 'does not delete pipeline_schedule' 

    end
  end

  describe 'POST /projects/:id/pipeline_schedules/:pipeline_schedule_id/variables' do
    let(:params) { attributes_for(:ci_pipeline_schedule_variable) }

    set(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    context 'authenticated user with valid permissions' do
      context 'with required parameters' do
        it 'creates pipeline_schedule_variable' 

      end

      context 'without required parameters' do
        it 'does not create pipeline_schedule_variable' 

      end

      context 'when key has validation error' do
        it 'does not create pipeline_schedule_variable' 

      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not create pipeline_schedule_variable' 

    end

    context 'unauthenticated user' do
      it 'does not create pipeline_schedule_variable' 

    end
  end

  describe 'PUT /projects/:id/pipeline_schedules/:pipeline_schedule_id/variables/:key' do
    set(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    let(:pipeline_schedule_variable) do
      create(:ci_pipeline_schedule_variable, pipeline_schedule: pipeline_schedule)
    end

    context 'authenticated user with valid permissions' do
      it 'updates pipeline_schedule_variable' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not update pipeline_schedule_variable' 

    end

    context 'unauthenticated user' do
      it 'does not update pipeline_schedule_variable' 

    end
  end

  describe 'DELETE /projects/:id/pipeline_schedules/:pipeline_schedule_id/variables/:key' do
    let(:master) { create(:user) }

    set(:pipeline_schedule) do
      create(:ci_pipeline_schedule, project: project, owner: developer)
    end

    let!(:pipeline_schedule_variable) do
      create(:ci_pipeline_schedule_variable, pipeline_schedule: pipeline_schedule)
    end

    before do
      project.add_master(master)
    end

    context 'authenticated user with valid permissions' do
      it 'deletes pipeline_schedule_variable' 


      it 'responds with 404 Not Found if requesting non-existing pipeline_schedule_variable' 

    end

    context 'authenticated user with invalid permissions' do
      let!(:pipeline_schedule) { create(:ci_pipeline_schedule, project: project, owner: master) }

      it 'does not delete pipeline_schedule_variable' 

    end

    context 'unauthenticated user' do
      it 'does not delete pipeline_schedule_variable' 

    end
  end
end

