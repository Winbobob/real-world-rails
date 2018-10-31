# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RescueType do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'accepts rescue modifier' 


  it 'accepts rescuing nothing' 


  it 'accepts rescuing a single exception' 


  it 'accepts rescuing nothing within a method definition' 


  shared_examples 'offenses' do |rescues|
    context 'begin rescue' do
      context "rescuing from #{rescues}" do
        let(:source) do
          <<-RUBY
            begin
              foo
            rescue #{rescues}
              bar
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context "rescuing from #{rescues} before another exception" do
        let(:source) do
          <<-RUBY
            begin
              foo
            rescue #{rescues}, StandardError
              bar
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context "rescuing from #{rescues} after another exception" do
        let(:source) do
          <<-RUBY
            begin
              foo
            rescue StandardError, #{rescues}
              bar
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end
    end

    context 'begin rescue ensure' do
      context "rescuing from #{rescues}" do
        let(:source) do
          <<-RUBY
            begin
              foo
            rescue #{rescues}
              bar
            ensure
              baz
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end
    end

    context 'def rescue' do
      context "rescuing from #{rescues}" do
        let(:source) do
          <<-RUBY
            def foobar
              foo
            rescue #{rescues}
              bar
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end
    end

    context 'def rescue ensure' do
      context "rescuing from #{rescues}" do
        let(:source) do
          <<-RUBY
            def foobar
              foo
            rescue #{rescues}
              bar
            ensure
              baz
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end
    end
  end

  it_behaves_like 'offenses', 'nil'
  it_behaves_like 'offenses', "'string'"
  it_behaves_like 'offenses', '"#{string}"'
  it_behaves_like 'offenses', '0'
  it_behaves_like 'offenses', '0.0'
  it_behaves_like 'offenses', '[]'
  it_behaves_like 'offenses', '{}'
  it_behaves_like 'offenses', ':symbol'
end

