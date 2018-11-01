require 'spec_helper'

describe Gitlab::Ci::Config do
  let(:config) do
    described_class.new(yml)
  end

  context 'when config is valid' do
    let(:yml) do
      <<-EOS
        image: ruby:2.2

        rspec:
          script:
            - gem install rspec
            - rspec
      EOS
    end

    describe '#to_hash' do
      it 'returns hash created from string' 


      describe '#valid?' do
        it 'is valid' 


        it 'has no errors' 

      end
    end
  end

  context 'when using extendable hash' do
    let(:yml) do
      <<-EOS
        image: ruby:2.2

        rspec:
          script: rspec

        test:
          extends: rspec
          image: ruby:alpine
      EOS
    end

    it 'correctly extends the hash' 

  end

  context 'when config is invalid' do
    context 'when yml is incorrect' do
      let(:yml) { '// invalid' }

      describe '.new' do
        it 'raises error' 

      end
    end

    context 'when config logic is incorrect' do
      let(:yml) { 'before_script: "ls"' }

      describe '#valid?' do
        it 'is not valid' 


        it 'has errors' 

      end

      describe '#errors' do
        it 'returns an array of strings' 

      end
    end

    context 'when invalid extended hash has been provided' do
      let(:yml) do
        <<-EOS
          test:
            extends: test
            script: rspec
        EOS
      end

      it 'raises an error' 

    end
  end

  context "when using 'include' directive" do
    let(:project) { create(:project, :repository) }
    let(:remote_location) { 'https://gitlab.com/gitlab-org/gitlab-ce/blob/1234/.gitlab-ci-1.yml' }
    let(:local_location) { 'spec/fixtures/gitlab/ci/external_files/.gitlab-ci-template-1.yml' }

    let(:remote_file_content) do
      <<~HEREDOC
      variables:
        AUTO_DEVOPS_DOMAIN: domain.example.com
        POSTGRES_USER: user
        POSTGRES_PASSWORD: testing-password
        POSTGRES_ENABLED: "true"
        POSTGRES_DB: $CI_ENVIRONMENT_SLUG
      HEREDOC
    end

    let(:local_file_content) do
      File.read(Rails.root.join(local_location))
    end

    let(:gitlab_ci_yml) do
      <<~HEREDOC
      include:
        - #{local_location}
        - #{remote_location}

      image: ruby:2.2
      HEREDOC
    end

    let(:config) do
      described_class.new(gitlab_ci_yml, project: project, sha: '12345')
    end

    before do
      WebMock.stub_request(:get, remote_location)
        .to_return(body: remote_file_content)

      allow(project.repository)
        .to receive(:blob_data_at).and_return(local_file_content)
    end

    context "when gitlab_ci_yml has valid 'include' defined" do
      it 'should return a composed hash' 

    end

    context "when gitlab_ci.yml has invalid 'include' defined"  do
      let(:gitlab_ci_yml) do
        <<~HEREDOC
          include: invalid
        HEREDOC
      end

      it 'raises error YamlProcessor validationError' 

    end

    describe 'external file version' do
      context 'when external local file SHA is defined' do
        it 'is using a defined value' 

      end

      context 'when external local file SHA is not defined' do
        it 'is using latest SHA on the default branch' 

      end
    end

    context "when both external files and gitlab_ci.yml defined the same key" do
      let(:gitlab_ci_yml) do
        <<~HEREDOC
        include:
          - #{remote_location}

        image: ruby:2.2
        HEREDOC
      end

      let(:remote_file_content) do
        <<~HEREDOC
        image: php:5-fpm-alpine
        HEREDOC
      end

      it 'should take precedence' 

    end

    context "when both external files and gitlab_ci.yml define a dictionary of distinct variables" do
      let(:remote_file_content) do
        <<~HEREDOC
        variables:
          A: 'alpha'
          B: 'beta'
        HEREDOC
      end

      let(:gitlab_ci_yml) do
        <<~HEREDOC
        include:
          - #{remote_location}

        variables:
          C: 'gamma'
          D: 'delta'
        HEREDOC
      end

      it 'should merge the variables dictionaries' 

    end

    context "when both external files and gitlab_ci.yml define a dictionary of overlapping variables" do
      let(:remote_file_content) do
        <<~HEREDOC
        variables:
          A: 'alpha'
          B: 'beta'
          C: 'omnicron'
        HEREDOC
      end

      let(:gitlab_ci_yml) do
        <<~HEREDOC
        include:
          - #{remote_location}

        variables:
          C: 'gamma'
          D: 'delta'
        HEREDOC
      end

      it 'later declarations should take precedence' 

    end

    context 'when both external files and gitlab_ci.yml define a job' do
      let(:remote_file_content) do
        <<~HEREDOC
        job1:
          script:
          - echo 'hello from remote file'
        HEREDOC
      end

      let(:gitlab_ci_yml) do
        <<~HEREDOC
        include:
          - #{remote_location}

        job1:
          variables:
            VARIABLE_DEFINED_IN_MAIN_FILE: 'some value'
        HEREDOC
      end

      it 'merges the jobs' 


      context 'when the script key is in both' do
        let(:gitlab_ci_yml) do
          <<~HEREDOC
          include:
            - #{remote_location}

          job1:
            script:
            - echo 'hello from main file'
            variables:
              VARIABLE_DEFINED_IN_MAIN_FILE: 'some value'
          HEREDOC
        end

        it 'uses the script from the gitlab_ci.yml' 

      end
    end
  end
end

