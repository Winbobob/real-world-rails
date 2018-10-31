require 'spec_helper'

describe API::Pipelines do
  let(:user)        { create(:user) }
  let(:non_member)  { create(:user) }
  let(:project)     { create(:project, :repository, creator: user) }

  let!(:pipeline) do
    create(:ci_empty_pipeline, project: project, sha: project.commit.id,
                               ref: project.default_branch, user: user)
  end

  before do
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/pipelines ' do
    context 'authorized user' do
      it 'returns project pipelines' 


      context 'when parameter is passed' do
        %w[running pending].each do |target|
          context "when scope is #{target}" do
            before do
              create(:ci_pipeline, project: project, status: target)
            end

            it 'returns matched pipelines' 

          end
        end

        context 'when scope is finished' do
          before do
            create(:ci_pipeline, project: project, status: 'success')
            create(:ci_pipeline, project: project, status: 'failed')
            create(:ci_pipeline, project: project, status: 'canceled')
          end

          it 'returns matched pipelines' 

        end

        context 'when scope is branches or tags' do
          let!(:pipeline_branch) { create(:ci_pipeline, project: project) }
          let!(:pipeline_tag) { create(:ci_pipeline, project: project, ref: 'v1.0.0', tag: true) }

          context 'when scope is branches' do
            it 'returns matched pipelines' 

          end

          context 'when scope is tags' do
            it 'returns matched pipelines' 

          end
        end

        context 'when scope is invalid' do
          it 'returns bad_request' 

        end

        HasStatus::AVAILABLE_STATUSES.each do |target|
          context "when status is #{target}" do
            before do
              create(:ci_pipeline, project: project, status: target)
              exception_status = HasStatus::AVAILABLE_STATUSES - [target]
              create(:ci_pipeline, project: project, status: exception_status.sample)
            end

            it 'returns matched pipelines' 

          end
        end

        context 'when status is invalid' do
          it 'returns bad_request' 

        end

        context 'when ref is specified' do
          before do
            create(:ci_pipeline, project: project)
          end

          context 'when ref exists' do
            it 'returns matched pipelines' 

          end

          context 'when ref does not exist' do
            it 'returns empty' 

          end
        end

        context 'when name is specified' do
          let!(:pipeline) { create(:ci_pipeline, project: project, user: user) }

          context 'when name exists' do
            it 'returns matched pipelines' 

          end

          context 'when name does not exist' do
            it 'returns empty' 

          end
        end

        context 'when username is specified' do
          let!(:pipeline) { create(:ci_pipeline, project: project, user: user) }

          context 'when username exists' do
            it 'returns matched pipelines' 

          end

          context 'when username does not exist' do
            it 'returns empty' 

          end
        end

        context 'when yaml_errors is specified' do
          let!(:pipeline1) { create(:ci_pipeline, project: project, yaml_errors: 'Syntax error') }
          let!(:pipeline2) { create(:ci_pipeline, project: project) }

          context 'when yaml_errors is true' do
            it 'returns matched pipelines' 

          end

          context 'when yaml_errors is false' do
            it 'returns matched pipelines' 

          end

          context 'when yaml_errors is invalid' do
            it 'returns bad_request' 

          end
        end

        context 'when order_by and sort are specified' do
          context 'when order_by user_id' do
            before do
              3.times do
                create(:ci_pipeline, project: project, user: create(:user))
              end
            end

            context 'when sort parameter is valid' do
              it 'sorts as user_id: :desc' 

            end

            context 'when sort parameter is invalid' do
              it 'returns bad_request' 

            end
          end

          context 'when order_by is invalid' do
            it 'returns bad_request' 

          end
        end
      end
    end

    context 'unauthorized user' do
      it 'does not return project pipelines' 

    end
  end

  describe 'POST /projects/:id/pipeline ' do
    def expect_variables(variables, expected_variables)
      variables.each_with_index do |variable, index|
        expected_variable = expected_variables[index]

        expect(variable.key).to eq(expected_variable['key'])
        expect(variable.value).to eq(expected_variable['value'])
      end
    end

    context 'authorized user' do
      context 'with gitlab-ci.yml' do
        before do
          stub_ci_pipeline_to_return_yaml_file
        end

        it 'creates and returns a new pipeline' 


        context 'variables given' do
          let(:variables) { [{ 'key' => 'UPLOAD_TO_S3', 'value' => 'true' }] }

          it 'creates and returns a new pipeline using the given variables' 

        end

        describe 'using variables conditions' do
          let(:variables) { [{ 'key' => 'STAGING', 'value' => 'true' }] }

          before do
            config = YAML.dump(test: { script: 'test', only: { variables: ['$STAGING'] } })
            stub_ci_pipeline_yaml_file(config)
          end

          it 'creates and returns a new pipeline using the given variables' 


          context 'condition unmatch' do
            let(:variables) { [{ 'key' => 'STAGING', 'value' => 'false' }] }

            it "doesn't create a job" 

          end
        end

        it 'fails when using an invalid ref' 

      end

      context 'without gitlab-ci.yml' do
        context 'without auto devops enabled' do
          before do
            project.update!(auto_devops_attributes: { enabled: false })
          end

          it 'fails to create pipeline' 

        end
      end
    end

    context 'unauthorized user' do
      it 'does not create pipeline' 

    end
  end

  describe 'GET /projects/:id/pipelines/:pipeline_id' do
    context 'authorized user' do
      it 'returns project pipelines' 


      it 'returns 404 when it does not exist' 


      context 'with coverage' do
        before do
          create(:ci_build, coverage: 30, pipeline: pipeline)
        end

        it 'exposes the coverage' 

      end
    end

    context 'unauthorized user' do
      it 'should not return a project pipeline' 

    end
  end

  describe 'POST /projects/:id/pipelines/:pipeline_id/retry' do
    context 'authorized user' do
      let!(:pipeline) do
        create(:ci_pipeline, project: project, sha: project.commit.id,
                             ref: project.default_branch)
      end

      let!(:build) { create(:ci_build, :failed, pipeline: pipeline) }

      it 'retries failed builds' 

    end

    context 'unauthorized user' do
      it 'should not return a project pipeline' 

    end
  end

  describe 'POST /projects/:id/pipelines/:pipeline_id/cancel' do
    let!(:pipeline) do
      create(:ci_empty_pipeline, project: project, sha: project.commit.id,
                                 ref: project.default_branch)
    end

    let!(:build) { create(:ci_build, :running, pipeline: pipeline) }

    context 'authorized user' do
      it 'retries failed builds' 

    end

    context 'user without proper access rights' do
      let!(:reporter) { create(:user) }

      before do
        project.add_reporter(reporter)
      end

      it 'rejects the action' 

    end
  end
end

