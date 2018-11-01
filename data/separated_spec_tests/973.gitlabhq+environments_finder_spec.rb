require 'spec_helper'

describe EnvironmentsFinder do
  describe '#execute' do
    let(:project) { create(:project, :repository) }
    let(:user) { project.creator }
    let(:environment) { create(:environment, project: project) }

    before do
      project.add_maintainer(user)
    end

    context 'tagged deployment' do
      before do
        create(:deployment, environment: environment, ref: 'v1.1.0', tag: true, sha: project.commit.id)
      end

      it 'returns environment when with_tags is set' 


      it 'does not return environment when no with_tags is set' 


      it 'does not return environment when commit is not part of deployment' 

    end

    context 'branch deployment' do
      before do
        create(:deployment, environment: environment, ref: 'master', sha: project.commit.id)
      end

      it 'returns environment when ref is set' 


      it 'does not environment when ref is different' 


      it 'does not return environment when commit is not part of deployment' 


      it 'returns environment when commit constraint is not set' 

    end

    context 'commit deployment' do
      before do
        create(:deployment, environment: environment, ref: 'master', sha: project.commit.id)
      end

      it 'returns environment' 

    end

    context 'recently updated' do
      context 'when last deployment to environment is the most recent one' do
        before do
          create(:deployment, environment: environment, ref: 'feature')
        end

        it 'finds recently updated environment' 

      end

      context 'when last deployment to environment is not the most recent' do
        before do
          create(:deployment, environment: environment, ref: 'feature')
          create(:deployment, environment: environment, ref: 'master')
        end

        it 'does not find environment' 

      end

      context 'when there are two environments that deploy to the same branch' do
        let(:second_environment) { create(:environment, project: project) }

        before do
          create(:deployment, environment: environment, ref: 'feature')
          create(:deployment, environment: second_environment, ref: 'feature')
        end

        it 'finds both environments' 

      end
    end
  end
end

