require 'spec_helper'

describe CreateDeploymentService do
  let(:user) { create(:user) }
  let(:options) { nil }

  let(:job) do
    create(:ci_build,
      ref: 'master',
      tag: false,
      environment: 'production',
      options: { environment: options })
  end

  let(:project) { job.project }

  let!(:environment) do
    create(:environment, project: project, name: 'production')
  end

  let(:service) { described_class.new(job) }

  before do
    allow_any_instance_of(Deployment).to receive(:create_ref)
  end

  describe '#execute' do
    subject { service.execute }

    context 'when environment exists' do
      it 'creates a deployment' 

    end

    context 'when environment does not exist' do
      let(:environment) {}

      it 'does not create a deployment' 

    end

    context 'when start action is defined' do
      let(:options) { { action: 'start' } }

      context 'and environment is stopped' do
        before do
          environment.stop
        end

        it 'makes environment available' 


        it 'creates a deployment' 

      end
    end

    context 'when stop action is defined' do
      let(:options) { { action: 'stop' } }

      context 'and environment is available' do
        before do
          environment.start
        end

        it 'makes environment stopped' 


        it 'does not create a deployment' 

      end
    end

    context 'when variables are used' do
      let(:options) do
        { name: 'review-apps/$CI_COMMIT_REF_NAME',
          url: 'http://$CI_COMMIT_REF_NAME.review-apps.gitlab.com' }
      end

      before do
        environment.update(name: 'review-apps/master')
        job.update(environment: 'review-apps/$CI_COMMIT_REF_NAME')
      end

      it 'creates a new deployment' 


      it 'does not create a new environment' 


      it 'updates external url' 

    end

    context 'when project was removed' do
      let(:environment) {}

      before do
        job.update(project: nil)
      end

      it 'does not create deployment or environment' 

    end
  end

  describe '#expanded_environment_url' do
    subject { service.send(:expanded_environment_url) }

    context 'when yaml environment uses $CI_COMMIT_REF_NAME' do
      let(:job) do
        create(:ci_build,
               ref: 'master',
               options: { environment: { url: 'http://review/$CI_COMMIT_REF_NAME' } })
      end

      it { is_expected.to eq('http://review/master') }
    end

    context 'when yaml environment uses $CI_ENVIRONMENT_SLUG' do
      let(:job) do
        create(:ci_build,
               ref: 'master',
               environment: 'production',
               options: { environment: { url: 'http://review/$CI_ENVIRONMENT_SLUG' } })
      end

      let!(:environment) do
        create(:environment,
          project: job.project,
          name: 'production',
          slug: 'prod-slug',
          external_url: 'http://review/old')
      end

      it { is_expected.to eq('http://review/prod-slug') }
    end

    context 'when yaml environment uses yaml_variables containing symbol keys' do
      let(:job) do
        create(:ci_build,
               yaml_variables: [{ key: :APP_HOST, value: 'host' }],
               options: { environment: { url: 'http://review/$APP_HOST' } })
      end

      it { is_expected.to eq('http://review/host') }
    end

    context 'when yaml environment does not have url' do
      let(:job) { create(:ci_build, environment: 'staging') }

      let!(:environment) do
        create(:environment, project: job.project, name: job.environment)
      end

      it 'returns the external_url from persisted environment' 

    end
  end

  describe 'processing of builds' do
    shared_examples 'does not create deployment' do
      it 'does not create a new deployment' 


      it 'does not call a service' 

    end

    shared_examples 'creates deployment' do
      it 'creates a new deployment' 


      it 'calls a service' 


      it 'is set as deployable' 


      it 'updates environment URL' 

    end

    context 'without environment specified' do
      let(:job) { create(:ci_build) }

      it_behaves_like 'does not create deployment' do
        subject { job.success }
      end
    end

    context 'when environment is specified' do
      let(:deployable) { job }

      let(:options) do
        { environment: { name: 'production', url: 'http://gitlab.com' } }
      end

      context 'when job succeeds' do
        it_behaves_like 'creates deployment' do
          subject { job.success }
        end
      end

      context 'when job fails' do
        it_behaves_like 'does not create deployment' do
          subject { job.drop }
        end
      end

      context 'when job is retried' do
        it_behaves_like 'creates deployment' do
          before do
            stub_not_protect_default_branch

            project.add_developer(user)
          end

          let(:deployable) { Ci::Build.retry(job, user) }

          subject { deployable.success }
        end
      end
    end
  end

  describe "merge request metrics" do
    let(:merge_request) { create(:merge_request, target_branch: 'master', source_branch: 'feature', source_project: project) }

    context "while updating the 'first_deployed_to_production_at' time" do
      before do
        merge_request.metrics.update!(merged_at: Time.now)
      end

      context "for merge requests merged before the current deploy" do
        it "sets the time if the deploy's environment is 'production'" 


        it "doesn't set the time if the deploy's environment is not 'production'" 


        it 'does not raise errors if the merge request does not have a metrics record' 

      end

      context "for merge requests merged before the previous deploy" do
        context "if the 'first_deployed_to_production_at' time is already set" do
          it "does not overwrite the older 'first_deployed_to_production_at' time" 

        end

        context "if the 'first_deployed_to_production_at' time is not already set" do
          it "does not overwrite the older 'first_deployed_to_production_at' time" 

        end
      end
    end
  end
end

