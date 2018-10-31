require 'spec_helper'

module Gitlab
  module Ci
    describe YamlProcessor do
      subject { described_class.new(config) }

      describe '#build_attributes' do
        subject { described_class.new(config).build_attributes(:rspec) }

        describe 'attributes list' do
          let(:config) do
            YAML.dump(
              before_script: ['pwd'],
              rspec: { script: 'rspec' }
            )
          end

          it 'returns valid build attributes' 

        end

        describe 'coverage entry' do
          describe 'code coverage regexp' do
            let(:config) do
              YAML.dump(rspec: { script: 'rspec',
                                 coverage: '/Code coverage: \d+\.\d+/' })
            end

            it 'includes coverage regexp in build attributes' 

          end
        end

        describe 'retry entry' do
          context 'when retry count is specified' do
            let(:config) do
              YAML.dump(rspec: { script: 'rspec', retry: 1 })
            end

            it 'includes retry count in build options attribute' 

          end

          context 'when retry count is not specified' do
            let(:config) do
              YAML.dump(rspec: { script: 'rspec' })
            end

            it 'does not persist retry count in the database' 

          end
        end

        describe 'allow failure entry' do
          context 'when job is a manual action' do
            context 'when allow_failure is defined' do
              let(:config) do
                YAML.dump(rspec: { script: 'rspec',
                                   when: 'manual',
                                   allow_failure: false })
              end

              it 'is not allowed to fail' 

            end

            context 'when allow_failure is not defined' do
              let(:config) do
                YAML.dump(rspec: { script: 'rspec',
                                   when: 'manual' })
              end

              it 'is allowed to fail' 

            end
          end

          context 'when job is not a manual action' do
            context 'when allow_failure is defined' do
              let(:config) do
                YAML.dump(rspec: { script: 'rspec',
                                   allow_failure: false })
              end

              it 'is not allowed to fail' 

            end

            context 'when allow_failure is not defined' do
              let(:config) do
                YAML.dump(rspec: { script: 'rspec' })
              end

              it 'is not allowed to fail' 

            end
          end
        end

        describe 'delayed job entry' do
          context 'when delayed is defined' do
            let(:config) do
              YAML.dump(rspec: { script: 'rollout 10%',
                                 when: 'delayed',
                                 start_in: '1 day' })
            end

            it 'has the attributes' 

          end
        end
      end

      describe '#stages_attributes' do
        let(:config) do
          YAML.dump(
            rspec: { script: 'rspec', stage: 'test', only: ['branches'] },
            prod: { script: 'cap prod', stage: 'deploy', only: ['tags'] }
          )
        end

        let(:attributes) do
          [{ name: "build",
             index: 0,
             builds: [] },
           { name: "test",
             index: 1,
             builds:
               [{ stage_idx: 1,
                  stage: "test",
                  commands: "rspec",
                  tag_list: [],
                  name: "rspec",
                  allow_failure: false,
                  when: "on_success",
                  environment: nil,
                  coverage_regex: nil,
                  yaml_variables: [],
                  options: { script: ["rspec"] },
                  only: { refs: ["branches"] },
                  except: {} }] },
           { name: "deploy",
             index: 2,
             builds:
               [{ stage_idx: 2,
                  stage: "deploy",
                  commands: "cap prod",
                  tag_list: [],
                  name: "prod",
                  allow_failure: false,
                  when: "on_success",
                  environment: nil,
                  coverage_regex: nil,
                  yaml_variables: [],
                  options: { script: ["cap prod"] },
                  only: { refs: ["tags"] },
                  except: {} }] }]
        end

        it 'returns stages seed attributes' 

      end

      describe 'only / except policies validations' do
        context 'when `only` has an invalid value' do
          let(:config) { { rspec: { script: "rspec", type: "test", only: only } } }
          let(:processor) { Gitlab::Ci::YamlProcessor.new(YAML.dump(config)) }

          context 'when it is integer' do
            let(:only) { 1 }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:only has to be either an array of conditions or a hash')
            end
          end

          context 'when it is an array of integers' do
            let(:only) { [1, 1] }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:only config should be an array of strings or regexps')
            end
          end

          context 'when it is invalid regex' do
            let(:only) { ["/*invalid/"] }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:only config should be an array of strings or regexps')
            end
          end
        end

        context 'when `except` has an invalid value' do
          let(:config) { { rspec: { script: "rspec", except: except } } }
          let(:processor) { Gitlab::Ci::YamlProcessor.new(YAML.dump(config)) }

          context 'when it is integer' do
            let(:except) { 1 }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:except has to be either an array of conditions or a hash')
            end
          end

          context 'when it is an array of integers' do
            let(:except) { [1, 1] }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:except config should be an array of strings or regexps')
            end
          end

          context 'when it is invalid regex' do
            let(:except) { ["/*invalid/"] }

            it do
              expect { processor }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError,
                                                  'jobs:rspec:except config should be an array of strings or regexps')
            end
          end
        end
      end

      describe "Scripts handling" do
        let(:config_data) { YAML.dump(config) }
        let(:config_processor) { Gitlab::Ci::YamlProcessor.new(config_data) }

        subject { config_processor.stage_builds_attributes('test').first }

        describe "before_script" do
          context "in global context" do
            let(:config) do
              {
                before_script: ["global script"],
                test: { script: ["script"] }
              }
            end

            it "return commands with scripts concencaced" 

          end

          context "overwritten in local context" do
            let(:config) do
              {
                before_script: ["global script"],
                test: { before_script: ["local script"], script: ["script"] }
              }
            end

            it "return commands with scripts concencaced" 

          end
        end

        describe "script" do
          let(:config) do
            {
              test: { script: ["script"] }
            }
          end

          it "return commands with scripts concencaced" 

        end

        describe "after_script" do
          context "in global context" do
            let(:config) do
              {
                after_script: ["after_script"],
                test: { script: ["script"] }
              }
            end

            it "return after_script in options" 

          end

          context "overwritten in local context" do
            let(:config) do
              {
                after_script: ["local after_script"],
                test: { after_script: ["local after_script"], script: ["script"] }
              }
            end

            it "return after_script in options" 

          end
        end
      end

      describe "Image and service handling" do
        context "when extended docker configuration is used" do
          it "returns image and service when defined" 


          it "returns image and service when overridden for job" 

        end

        context "when etended docker configuration is not used" do
          it "returns image and service when defined" 


          it "returns image and service when overridden for job" 

        end
      end

      describe 'Variables' do
        let(:config_processor) { Gitlab::Ci::YamlProcessor.new(YAML.dump(config)) }

        subject { config_processor.builds.first[:yaml_variables] }

        context 'when global variables are defined' do
          let(:variables) do
            { 'VAR1' => 'value1', 'VAR2' => 'value2' }
          end
          let(:config) do
            {
              variables: variables,
              before_script: ['pwd'],
              rspec: { script: 'rspec' }
            }
          end

          it 'returns global variables' 

        end

        context 'when job and global variables are defined' do
          let(:global_variables) do
            { 'VAR1' => 'global1', 'VAR3' => 'global3' }
          end
          let(:job_variables) do
            { 'VAR1' => 'value1', 'VAR2' => 'value2' }
          end
          let(:config) do
            {
              before_script: ['pwd'],
              variables: global_variables,
              rspec: { script: 'rspec', variables: job_variables }
            }
          end

          it 'returns all unique variables' 

        end

        context 'when job variables are defined' do
          let(:config) do
            {
              before_script: ['pwd'],
              rspec: { script: 'rspec', variables: variables }
            }
          end

          context 'when syntax is correct' do
            let(:variables) do
              { 'VAR1' => 'value1', 'VAR2' => 'value2' }
            end

            it 'returns job variables' 

          end

          context 'when syntax is incorrect' do
            context 'when variables defined but invalid' do
              let(:variables) do
                %w(VAR1 value1 VAR2 value2)
              end

              it 'raises error' 

            end

            context 'when variables key defined but value not specified' do
              let(:variables) do
                nil
              end

              it 'returns empty array' 

            end
          end
        end

        context 'when job variables are not defined' do
          let(:config) do
            {
              before_script: ['pwd'],
              rspec: { script: 'rspec' }
            }
          end

          it 'returns empty array' 

        end
      end

      context 'when using `extends`' do
        let(:config_processor) { Gitlab::Ci::YamlProcessor.new(config) }

        subject { config_processor.builds.first }

        context 'when using simple `extends`' do
          let(:config) do
            <<~YAML
              .template:
                script: test

              rspec:
                extends: .template
                image: ruby:alpine
            YAML
          end

          it 'correctly extends rspec job' 

        end

        context 'when using recursive `extends`' do
          let(:config) do
            <<~YAML
              rspec:
                extends: .test
                script: rspec
                when: always

              .template:
                before_script:
                  - bundle install

              .test:
                extends: .template
                script: test
                image: image:test
            YAML
          end

          it 'correctly extends rspec job' 

        end
      end

      describe "When" do
        %w(on_success on_failure always).each do |when_state|
          it "returns #{when_state} when defined" 

        end
      end

      describe 'cache' do
        context 'when cache definition has unknown keys' do
          it 'raises relevant validation error' 

        end

        it "returns cache when defined globally" 


        it "returns cache when defined in a job" 


        it "overwrite cache when defined for a job and globally" 

      end

      describe "Artifacts" do
        it "returns artifacts when defined" 


        %w[on_success on_failure always].each do |when_state|
          it "returns artifacts for when #{when_state}  defined" 

        end
      end

      describe '#environment' do
        let(:config) do
          {
            deploy_to_production: { stage: 'deploy', script: 'test', environment: environment }
          }
        end

        let(:processor) { Gitlab::Ci::YamlProcessor.new(YAML.dump(config)) }
        let(:builds) { processor.stage_builds_attributes('deploy') }

        context 'when a production environment is specified' do
          let(:environment) { 'production' }

          it 'does return production' 

        end

        context 'when hash is specified' do
          let(:environment) do
            { name: 'production',
              url: 'http://production.gitlab.com' }
          end

          it 'does return production and URL' 


          context 'the url has a port as variable' do
            let(:environment) do
              { name: 'production',
                url: 'http://production.gitlab.com:$PORT' }
            end

            it 'allows a variable for the port' 

          end
        end

        context 'when no environment is specified' do
          let(:environment) { nil }

          it 'does return nil environment' 

        end

        context 'is not a string' do
          let(:environment) { 1 }

          it 'raises error' 

        end

        context 'is not a valid string' do
          let(:environment) { 'production:staging' }

          it 'raises error' 

        end

        context 'when on_stop is specified' do
          let(:review) { { stage: 'deploy', script: 'test', environment: { name: 'review', on_stop: 'close_review' } } }
          let(:config) { { review: review, close_review: close_review }.compact }

          context 'with matching job' do
            let(:close_review) { { stage: 'deploy', script: 'test', environment: { name: 'review', action: 'stop' } } }

            it 'does return a list of builds' 

          end

          context 'without matching job' do
            let(:close_review) { nil  }

            it 'raises error' 

          end

          context 'with close job without environment' do
            let(:close_review) { { stage: 'deploy', script: 'test' } }

            it 'raises error' 

          end

          context 'with close job for different environment' do
            let(:close_review) { { stage: 'deploy', script: 'test', environment: 'production' } }

            it 'raises error' 

          end

          context 'with close job without stop action' do
            let(:close_review) { { stage: 'deploy', script: 'test', environment: { name: 'review' } } }

            it 'raises error' 

          end
        end
      end

      describe "Dependencies" do
        let(:config) do
          {
            build1: { stage: 'build', script: 'test' },
            build2: { stage: 'build', script: 'test' },
            test1: { stage: 'test', script: 'test', dependencies: dependencies },
            test2: { stage: 'test', script: 'test' },
            deploy: { stage: 'test', script: 'test' }
          }
        end

        subject { Gitlab::Ci::YamlProcessor.new(YAML.dump(config)) }

        context 'no dependencies' do
          let(:dependencies) { }

          it { expect { subject }.not_to raise_error }
        end

        context 'dependencies to builds' do
          let(:dependencies) { %w(build1 build2) }

          it { expect { subject }.not_to raise_error }
        end

        context 'dependencies to builds defined as symbols' do
          let(:dependencies) { [:build1, :build2] }

          it { expect { subject }.not_to raise_error }
        end

        context 'undefined dependency' do
          let(:dependencies) { ['undefined'] }

          it { expect { subject }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError, 'test1 job: undefined dependency: undefined') }
        end

        context 'dependencies to deploy' do
          let(:dependencies) { ['deploy'] }

          it { expect { subject }.to raise_error(Gitlab::Ci::YamlProcessor::ValidationError, 'test1 job: dependency deploy is not defined in prior stages') }
        end
      end

      describe "Hidden jobs" do
        let(:config_processor) { Gitlab::Ci::YamlProcessor.new(config) }
        subject { config_processor.stage_builds_attributes("test") }

        shared_examples 'hidden_job_handling' do
          it "doesn't create jobs that start with dot" 

        end

        context 'when hidden job have a script definition' do
          let(:config) do
            YAML.dump({
                        '.hidden_job' => { image: 'ruby:2.1', script: 'test' },
                        'normal_job' => { script: 'test' }
                      })
          end

          it_behaves_like 'hidden_job_handling'
        end

        context "when hidden job doesn't have a script definition" do
          let(:config) do
            YAML.dump({
                        '.hidden_job' => { image: 'ruby:2.1' },
                        'normal_job' => { script: 'test' }
                      })
          end

          it_behaves_like 'hidden_job_handling'
        end
      end

      describe "YAML Alias/Anchor" do
        let(:config_processor) { Gitlab::Ci::YamlProcessor.new(config) }
        subject { config_processor.stage_builds_attributes("build") }

        shared_examples 'job_templates_handling' do
          it "is correctly supported for jobs" 

        end

        context 'when template is a job' do
          let(:config) do
            <<~EOT
            job1: &JOBTMPL
              stage: build
              script: execute-script-for-job

            job2: *JOBTMPL
            EOT
          end

          it_behaves_like 'job_templates_handling'
        end

        context 'when template is a hidden job' do
          let(:config) do
            <<~EOT
            .template: &JOBTMPL
              stage: build
              script: execute-script-for-job

            job1: *JOBTMPL

            job2: *JOBTMPL
            EOT
          end

          it_behaves_like 'job_templates_handling'
        end

        context 'when job adds its own keys to a template definition' do
          let(:config) do
            <<~EOT
            .template: &JOBTMPL
              stage: build

            job1:
              <<: *JOBTMPL
              script: execute-script-for-job

            job2:
              <<: *JOBTMPL
              script: execute-script-for-job
            EOT
          end

          it_behaves_like 'job_templates_handling'
        end
      end

      describe "Error handling" do
        it "fails to parse YAML" 


        it "indicates that object is invalid" 


        it "returns errors if tags parameter is invalid" 


        it "returns errors if before_script parameter is invalid" 


        it "returns errors if job before_script parameter is not an array of strings" 


        it "returns errors if after_script parameter is invalid" 


        it "returns errors if job after_script parameter is not an array of strings" 


        it "returns errors if image parameter is invalid" 


        it "returns errors if job name is blank" 


        it "returns errors if job name is non-string" 


        it "returns errors if job image parameter is invalid" 


        it "returns errors if services parameter is not an array" 


        it "returns errors if services parameter is not an array of strings" 


        it "returns errors if job services parameter is not an array" 


        it "returns errors if job services parameter is not an array of strings" 


        it "returns error if job configuration is invalid" 


        it "returns errors if services configuration is not correct" 


        it "returns errors if there are no jobs defined" 


        it "returns errors if there are no visible jobs defined" 


        it "returns errors if job allow_failure parameter is not an boolean" 


        it "returns errors if job stage is not a string" 


        it "returns errors if job stage is not a pre-defined stage" 


        it "returns errors if job stage is not a defined stage" 


        it "returns errors if stages is not an array" 


        it "returns errors if stages is not an array of strings" 


        it "returns errors if variables is not a map" 


        it "returns errors if variables is not a map of key-value strings" 


        it "returns errors if job when is not on_success, on_failure or always" 


        it "returns errors if job artifacts:name is not an a string" 


        it "returns errors if job artifacts:when is not an a predefined value" 


        it "returns errors if job artifacts:expire_in is not an a string" 


        it "returns errors if job artifacts:expire_in is not an a valid duration" 


        it "returns errors if job artifacts:untracked is not an array of strings" 


        it "returns errors if job artifacts:paths is not an array of strings" 


        it "returns errors if cache:untracked is not an array of strings" 


        it "returns errors if cache:paths is not an array of strings" 


        it "returns errors if cache:key is not a string" 


        it "returns errors if job cache:key is not an a string" 


        it "returns errors if job cache:untracked is not an array of strings" 


        it "returns errors if job cache:paths is not an array of strings" 


        it "returns errors if job dependencies is not an array of strings" 


        it 'returns errors if pipeline variables expression policy is invalid' 


        it 'returns errors if pipeline changes policy is invalid' 


        it 'returns errors if extended hash configuration is invalid' 

      end

      describe "#validation_message" do
        subject { Gitlab::Ci::YamlProcessor.validation_message(content) }

        context "when the YAML could not be parsed" do
          let(:content) { YAML.dump("invalid: yaml: test") }

          it { is_expected.to eq "Invalid configuration format" }
        end

        context "when the tags parameter is invalid" do
          let(:content) { YAML.dump({ rspec: { script: "test", tags: "mysql" } }) }

          it { is_expected.to eq "jobs:rspec tags should be an array of strings" }
        end

        context "when YAML content is empty" do
          let(:content) { '' }

          it { is_expected.to eq "Please provide content of .gitlab-ci.yml" }
        end

        context 'when the YAML contains an unknown alias' do
          let(:content) { 'steps: *bad_alias' }

          it { is_expected.to eq "Unknown alias: bad_alias" }
        end

        context "when the YAML is valid" do
          let(:content) { File.read(Rails.root.join('spec/support/gitlab_stubs/gitlab_ci.yml')) }

          it { is_expected.to be_nil }
        end
      end
    end
  end
end

