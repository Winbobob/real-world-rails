require 'spec_helper'

describe 'Projects > Show > User sees Git instructions' do
  set(:user) { create(:user) }

  shared_examples_for 'redirects to the sign in page' do
    it 'redirects to the sign in page' 

  end

  shared_examples_for 'shows details of empty project with no repo' do
    it 'shows Git command line instructions' 

  end

  shared_examples_for 'shows details of empty project' do
    let(:user_has_ssh_key) { false }

    it 'shows details' 

  end

  shared_examples_for 'shows details of non empty project' do
    let(:user_has_ssh_key) { false }

    it 'shows details' 

  end

  context 'when project is public' do
    context 'when project has no repo' do
      set(:project) { create(:project, :public) }

      before do
        sign_in(project.owner)
        visit project_path(project)
      end

      include_examples 'shows details of empty project with no repo'
    end

    context 'when project is empty' do
      set(:project) { create(:project_empty_repo, :public) }

      context 'when not signed in' do
        before do
          visit(project_path(project))
        end

        include_examples 'shows details of empty project'
      end

      context 'when signed in' do
        before do
          sign_in(user)
        end

        context 'when user does not have ssh keys' do
          before do
            visit(project_path(project))
          end

          include_examples 'shows details of empty project'
        end

        context 'when user has ssh keys' do
          before do
            create(:personal_key, user: user)

            visit(project_path(project))
          end

          include_examples 'shows details of empty project' do
            let(:user_has_ssh_key) { true }
          end
        end
      end
    end

    context 'when project is not empty' do
      set(:project) { create(:project, :public, :repository) }

      before do
        visit(project_path(project))
      end

      context 'when not signed in' do
        before do
          allow(Gitlab.config.gitlab).to receive(:host).and_return('www.example.com')
        end

        include_examples 'shows details of non empty project'
      end

      context 'when signed in' do
        before do
          sign_in(user)
        end

        context 'when user does not have ssh keys' do
          before do
            visit(project_path(project))
          end

          include_examples 'shows details of non empty project'
        end

        context 'when user has ssh keys' do
          before do
            create(:personal_key, user: user)

            visit(project_path(project))
          end

          include_examples 'shows details of non empty project' do
            let(:user_has_ssh_key) { true }
          end
        end
      end
    end
  end

  context 'when project is internal' do
    set(:project) { create(:project, :internal, :repository) }

    context 'when not signed in' do
      before do
        visit(project_path(project))
      end

      include_examples 'redirects to the sign in page'
    end

    context 'when signed in' do
      before do
        sign_in(user)

        visit(project_path(project))
      end

      include_examples 'shows details of non empty project'
    end
  end

  context 'when project is private' do
    set(:project) { create(:project, :private) }

    before do
      visit(project_path(project))
    end

    include_examples 'redirects to the sign in page'
  end
end

