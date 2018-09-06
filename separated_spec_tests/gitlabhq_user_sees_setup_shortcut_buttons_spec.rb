require 'spec_helper'

describe 'Projects > Show > User sees setup shortcut buttons' do
  # For "New file", "Add License" functionality,
  # see spec/features/projects/files/project_owner_creates_license_file_spec.rb
  # see spec/features/projects/files/project_owner_sees_link_to_create_license_file_in_empty_project_spec.rb

  let(:user) { create(:user) }

  describe 'empty project' do
    let(:project) { create(:project, :public, :empty_repo) }
    let(:presenter) { project.present(current_user: user) }

    describe 'as a normal user' do
      before do
        sign_in(user)

        visit project_path(project)
      end

      it 'no Auto DevOps button if can not manage pipelines' 


      it '"Auto DevOps enabled" button not linked' 

    end

    describe 'as a master' do
      before do
        project.add_master(user)
        sign_in(user)

        visit project_path(project)
      end

      it '"New file" button linked to new file page' 


      it '"Add Readme" button linked to new file populated for a readme' 


      it '"Add License" button linked to new file populated for a license' 


      describe 'Auto DevOps button' do
        it '"Enable Auto DevOps" button linked to settings page' 


        it '"Auto DevOps enabled" anchor linked to settings page' 

      end

      describe 'Kubernetes cluster button' do
        it '"Add Kubernetes cluster" button linked to clusters page' 


        it '"Kubernetes cluster" anchor linked to cluster page' 

      end
    end
  end

  describe 'populated project' do
    let(:project) { create(:project, :public, :repository) }
    let(:presenter) { project.present(current_user: user) }

    describe 'as a normal user' do
      before do
        sign_in(user)

        visit project_path(project)
      end

      it 'no Auto DevOps button if can not manage pipelines' 


      it '"Auto DevOps enabled" button not linked' 


      it 'no Kubernetes cluster button if can not manage clusters' 

    end

    describe 'as a master' do
      before do
        allow_any_instance_of(AutoDevopsHelper).to receive(:show_auto_devops_callout?).and_return(false)
        project.add_master(user)
        sign_in(user)

        visit project_path(project)
      end

      it 'no "Add Changelog" button if the project already has a changelog' 


      it 'no "Add License" button if the project already has a license' 


      it 'no "Add Contribution guide" button if the project already has a contribution guide' 


      describe 'GitLab CI configuration button' do
        it '"Set up CI/CD" button linked to new file populated for a .gitlab-ci.yml' 


        it 'no "Set up CI/CD" button if the project already has a .gitlab-ci.yml' 


        it 'no "Set up CI/CD" button if the project has Auto DevOps enabled' 

      end

      describe 'Auto DevOps button' do
        it '"Enable Auto DevOps" button linked to settings page' 


        it '"Enable Auto DevOps" button linked to settings page' 


        it 'no Auto DevOps button if Auto DevOps callout is shown' 


        it 'no "Enable Auto DevOps" button when .gitlab-ci.yml already exists' 

      end

      describe 'Kubernetes cluster button' do
        it '"Add Kubernetes cluster" button linked to clusters page' 


        it '"Kubernetes cluster" button linked to cluster page' 

      end

      describe '"Set up Koding" button' do
        it 'no "Set up Koding" button if Koding disabled' 


        it 'no "Set up Koding" button if the project already has a .koding.yml' 


        it '"Set up Koding" button linked to new file populated for a .koding.yml' 

      end
    end
  end
end

