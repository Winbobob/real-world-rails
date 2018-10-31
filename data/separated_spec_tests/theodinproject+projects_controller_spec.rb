require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:student) { double('Student', id: '1', admin?: false) }
  let(:admin) { double('Admin', id: '2', admin?: true) }
  let(:course) { double('Course', id: '1') }
  let(:lesson) {
    double('Lesson', id: '1', slug: 'building-blocks', course: course)
  }

  let(:valid_project_attrs) { { repo_url: 'https://github.com/user/repo' } }
  let(:invalid_project_attrs) { { repo_url: 'https://github.co' } }

  let(:valid_params) {
    {
      lesson_id: lesson.slug,
      project: valid_project_attrs
    }
  }

  let(:invalid_params) {
    {
      lesson_id: lesson.slug,
      project: invalid_project_attrs
    }
  }

  let(:projects) { double('ProjectsRelation') }
  let(:projects_association) { double('ProjectsAssociation') }
  let(:student_project) {
    double('Project', valid_project_attrs.merge(id: '1', user: student))
  }

  let(:admin_project) {
    double('Project', valid_project_attrs.merge(id: '2', user: admin))
  }

  describe 'GET #index' do
    before do
      allow(Lesson).to receive_message_chain(:friendly, :find)
        .with(valid_params[:lesson_id]).and_return(lesson)
      allow(Project).to receive(:all_submissions).with('1').and_return(projects)
      allow(projects).to receive(:order).with(updated_at: :desc).and_return(projects)
      allow(projects).to receive(:page).and_return(projects)
      allow(projects).to receive(:per).with(50).and_return(projects)
    end

    it 'renders the project index template' 


    it 'assigns @projects' 

  end

  describe 'POST #create' do
    subject { post :create, params: valid_params, xhr: true }

    context 'unauthenticated' do
      it_behaves_like 'unauthenticated request'
    end

    context 'authenticated' do
      before do
        allow(controller).to receive(:current_user).and_return(student)
        allow(Lesson).to receive_message_chain(:friendly, :find)
          .with(valid_params[:lesson_id]).and_return(lesson)
        allow(controller).to receive(:new_project).and_return(student_project)
      end

      it 'assigns recent submissions' 


      it 'renders the create template' 

    end
  end

  describe 'PATCH #update' do
    subject {
      patch :update,
      params: valid_params.merge(id: student_project.id),
      xhr: true
    }

    context 'unauthenticated' do
      it_behaves_like 'unauthenticated request'
    end

    context 'authenticated' do
      context 'standard user' do
        describe 'can update his/her project' do
          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(student_project.id).and_return(student_project)
            allow(controller).to receive(:authorize!).with(:update, student_project)
              .and_return(student_project)
          end

          context 'valid values' do
            it 'renders the update template' 

          end

          context 'invalid values' do
            it 'renders the update template' 

          end
        end

        describe "cannot update other user's project" do
          let(:request) {
            patch :update,
            params: valid_params.merge(id: admin_project.id),
            xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(admin_project.id).and_return(admin_project)
            allow(controller).to receive(:authorize!).with(:update, admin_project)
              .and_raise(CanCan::AccessDenied)
          end

          it_behaves_like 'unauthorized XHR request'
        end
      end

      context 'admin user' do
        describe 'can update his/her project' do
          let(:request) {
            patch :update, params: valid_params.merge(id: admin_project.id),
              xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(admin_project.id).and_return(admin_project)
            allow(controller).to receive(:authorize!).with(:update, admin_project)
              .and_return(admin_project)
          end

          context 'valid values' do
            it 'renders the update template' 

          end

          context 'invalid values' do
            it 'renders the update template' 

          end
        end

        describe "can update other user's project" do
          let(:request) {
            patch :update, params: valid_params.merge(id: student_project.id),
              xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(student_project.id).and_return(student_project)
            allow(controller).to receive(:authorize!).with(:update, student_project)
              .and_return(student_project)
          end

          context 'valid values' do
            it 'renders the update template' 

          end

          context 'invalid values' do
            it 'renders the update template' 

          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject {
      delete :destroy,
             params: { lesson_id: lesson.slug, id: student_project.id },
             xhr: true
    }

    context 'unauthenticated' do
      it_behaves_like 'unauthenticated request'
    end

    context 'authenticated' do
      context 'standard user' do
        describe 'can destroy his/her project' do
          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(student_project.id).and_return(student_project)
            allow(controller).to receive(:authorize!).with(:destroy, student_project)
              .and_return(student_project)
            allow(controller).to receive(:new_project).and_return(student_project) 
          end

          it 'assigns recent submissions' 


          it 'renders the destroy template' 

        end

        describe "cannot destroy other user's project" do
          let(:request) {
            delete :destroy, params: {
              lesson_id: lesson.slug, id: admin_project.id
            }, xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(admin_project.id).and_return(admin_project)
            allow(controller).to receive(:authorize!).with(:destroy, admin_project)
              .and_raise(CanCan::AccessDenied)
          end

          it_behaves_like 'unauthorized XHR request'
        end
      end

      context 'admin user' do
        describe 'can destroy his/her project' do
          let(:request) {
            delete :destroy,
                   params: { lesson_id: lesson.slug, id: admin_project.id },
                   xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(admin_project.id).and_return(admin_project)
            allow(controller).to receive(:authorize!).with(:destroy, admin_project)
              .and_return(admin_project)
            allow(controller).to receive(:new_project).and_return(admin_project)
            allow(controller).to receive(:latest_projects).and_return(projects)
          end

          it 'assigns recent submissions' 


          it 'renders the destroy template' 

        end

        describe "can destroy other user's project" do
          subject {
            delete :destroy,
                   params: { lesson_id: lesson.slug, id: student_project.id },
                   xhr: true
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Lesson).to receive_message_chain(:friendly, :find)
              .with(valid_params[:lesson_id]).and_return(lesson)
            allow(Project).to receive(:find).with(student_project.id).and_return(student_project)
            allow(controller).to receive(:authorize!).with(:destroy, student_project)
              .and_return(student_project)
            allow(controller).to receive(:new_project).and_return(admin_project)
            allow(controller).to receive(:latest_projects).and_return(projects)
          end

          it 'assigns recent submissions' 


          it 'renders the destroy template' 

        end
      end
    end
  end
end

