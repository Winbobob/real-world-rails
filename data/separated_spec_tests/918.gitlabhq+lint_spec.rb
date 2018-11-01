require 'spec_helper'

describe API::Lint do
  describe 'POST /ci/lint' do
    context 'with valid .gitlab-ci.yaml content' do
      let(:yaml_content) do
        File.read(Rails.root.join('spec/support/gitlab_stubs/gitlab_ci.yml'))
      end

      it 'passes validation' 

    end

    context 'with an invalid .gitlab_ci.yml' do
      it 'responds with errors about invalid syntax' 


      it "responds with errors about invalid configuration" 

    end

    context 'without the content parameter' do
      it 'responds with validation error about missing content' 

    end
  end
end

