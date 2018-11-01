# frozen_string_literal: true

module QA
  context 'Create' do
    describe 'File templates' do
      include Runtime::Fixtures

      def login
        Runtime::Browser.visit(:gitlab, Page::Main::Login)
        Page::Main::Login.act { sign_in_using_credentials }
      end

      before(:all) do
        login

        @project = Factory::Resource::Project.fabricate! do |project|
          project.name = 'file-template-project'
          project.description = 'Add file templates via the Files view'
        end

        Page::Main::Menu.act { sign_out }
      end

      templates = [
        {
          file_name: '.gitignore',
          name: 'Android',
          api_path: 'gitignores',
          api_key: 'Android'
        },
        {
          file_name: '.gitlab-ci.yml',
          name: 'Julia',
          api_path: 'gitlab_ci_ymls',
          api_key: 'Julia'
        },
        {
          file_name: 'Dockerfile',
          name: 'Python',
          api_path: 'dockerfiles',
          api_key: 'Python'
        },
        {
          file_name: 'LICENSE',
          name: 'Mozilla Public License 2.0',
          api_path: 'licenses',
          api_key: 'mpl-2.0'
        }
      ]

      templates.each do |template|
        it "user adds #{template[:file_name]} via file template #{template[:name]}" 

      end
    end
  end
end

