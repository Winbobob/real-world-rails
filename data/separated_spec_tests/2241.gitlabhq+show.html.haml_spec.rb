require 'spec_helper'

describe 'projects/ci/lints/show' do
  include Devise::Test::ControllerHelpers
  let(:project) { create(:project, :repository) }
  let(:config_processor) { Gitlab::Ci::YamlProcessor.new(YAML.dump(content)) }

  describe 'XSS protection' do
    before do
      assign(:project, project)
      assign(:status, true)
      assign(:builds, config_processor.builds)
      assign(:stages, config_processor.stages)
      assign(:jobs, config_processor.jobs)
    end

    context 'when builds attrbiutes contain HTML nodes' do
      let(:content) do
        {
          rspec: {
            script: '<h1>rspec</h1>',
            stage: 'test'
          }
        }
      end

      it 'does not render HTML elements' 

    end

    context 'when builds attributes do not contain HTML nodes' do
      let(:content) do
        {
          rspec: {
            script: 'rspec',
            stage: 'test'
          }
        }
      end

      it 'shows configuration in the table' 

    end
  end

  context 'when the content is valid' do
    let(:content) do
      {
        build_template: {
          script: './build.sh',
          tags: ['dotnet'],
          only: ['test@dude/repo'],
          except: ['deploy'],
          environment: 'testing'
        }
      }
    end

    before do
      assign(:project, project)
      assign(:status, true)
      assign(:builds, config_processor.builds)
      assign(:stages, config_processor.stages)
      assign(:jobs, config_processor.jobs)
    end

    it 'shows the correct values' 

  end

  context 'when the content is invalid' do
    before do
      assign(:project, project)
      assign(:status, false)
      assign(:error, 'Undefined error')
    end

    it 'shows error message' 

  end
end

