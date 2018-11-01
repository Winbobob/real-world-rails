require 'spec_helper'

describe Projects::AvatarsController do
  let(:project) { create(:project, :repository) }

  before do
    controller.instance_variable_set(:@project, project)
  end

  describe 'GET #show' do
    subject { get :show, namespace_id: project.namespace, project_id: project }

    context 'when repository has no avatar' do
      it 'shows 404' 

    end

    context 'when repository has an avatar' do
      before do
        allow(project).to receive(:avatar_in_git).and_return(filepath)
      end

      context 'when the avatar is stored in the repository' do
        let(:filepath) { 'files/images/logo-white.png' }

        it 'sends the avatar' 

      end

      context 'when the avatar is stored in lfs' do
        it_behaves_like 'repository lfs file load' do
          let(:filename) { 'lfs_object.iso' }
          let(:filepath) { "files/lfs/#{filename}" }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes avatar from DB by calling destroy' 

  end
end

