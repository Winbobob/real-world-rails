require 'spec_helper'

describe Projects::ImportsController do
  let(:user) { create(:user) }

  describe 'GET #show' do
    context 'when repository does not exists' do
      let(:project) { create(:project) }

      before do
        sign_in(user)
        project.add_master(user)
      end

      it 'renders template' 


      it 'sets flash.now if params is present' 

    end

    context 'when repository exists' do
      let(:project) { create(:project_empty_repo, import_url: 'https://github.com/vim/vim.git') }

      before do
        sign_in(user)
        project.add_master(user)
      end

      context 'when import is in progress' do
        before do
          project.update_attribute(:import_status, :started)
        end

        it 'renders template' 


        it 'sets flash.now if params is present' 

      end

      context 'when import failed' do
        before do
          project.update_attribute(:import_status, :failed)
        end

        it 'redirects to new_namespace_project_import_path' 

      end

      context 'when import finished' do
        before do
          project.update_attribute(:import_status, :finished)
        end

        context 'when project is a fork' do
          it 'redirects to namespace_project_path' 

        end

        context 'when project is external' do
          it 'redirects to namespace_project_path' 

        end

        context 'when continue params is present' do
          let(:params) do
            {
              to: project_path(project),
              notice: 'Finished'
            }
          end

          it 'redirects to internal params[:to]' 


          it 'does not redirect to external params[:to]' 

        end
      end

      context 'when import never happened' do
        before do
          project.update_attribute(:import_status, :none)
        end

        it 'redirects to namespace_project_path' 

      end
    end
  end
end

