# frozen_string_literal: true

require 'digest/sha1'

module QA
  context 'Release', :docker do
    describe 'Git clone using a deploy key' do
      def login
        Runtime::Browser.visit(:gitlab, Page::Main::Login)
        Page::Main::Login.act { sign_in_using_credentials }
      end

      before(:all) do
        login

        @runner_name = "qa-runner-#{Time.now.to_i}"

        @project = Factory::Resource::Project.fabricate! do |resource|
          resource.name = 'deploy-key-clone-project'
        end

        @repository_location = @project.repository_ssh_location

        Factory::Resource::Runner.fabricate! do |resource|
          resource.project = @project
          resource.name = @runner_name
          resource.tags = %w[qa docker]
          resource.image = 'gitlab/gitlab-runner:ubuntu'
        end

        Page::Main::Menu.act { sign_out }
      end

      after(:all) do
        Service::Runner.new(@runner_name).remove!
      end

      keys = [
        [Runtime::Key::RSA, 8192],
        [Runtime::Key::ECDSA, 521],
        [Runtime::Key::ED25519]
      ]

      keys.each do |(key_class, bits)|
        it "user sets up a deploy key with #{key_class}(#{bits}) to clone code using pipelines" 

      end
    end
  end
end

