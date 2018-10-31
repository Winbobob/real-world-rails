# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Gemspec::OrderedDependencies, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'TreatCommentsAsGroupSeparators' => treat_comments_as_group_separators,
      'Include' => nil
    }
  end
  let(:treat_comments_as_group_separators) { false }
  let(:message) do
    'Dependencies should be sorted in an alphabetical order within their ' \
      'section of the gemspec. Dependency `%s` should appear before `%s`.'
  end

  shared_examples :ordered_dependency do |add_dependency|
    context "When #{add_dependency}" do
      context 'When gems are alphabetically sorted' do
        it 'does not register any offenses' 

      end

      context 'When gems are not alphabetically sorted' do
        let(:source) { <<-RUBY.strip_indent }
          Gem::Specification.new do |spec|
            spec.#{add_dependency} 'rubocop'
            spec.#{add_dependency} 'rspec'
          end
        RUBY

        it 'registers an offense' 


        it 'autocorrects' 

      end

      context 'When each individual group of line is sorted' do
        it 'does not register any offenses' 

      end

      context 'When dependency is separated by multiline comment' do
        let(:source) { <<-RUBY.strip_indent }
          Gem::Specification.new do |spec|
            # For code quality
            spec.#{add_dependency} 'rubocop'
            # For
            # test
            spec.#{add_dependency} 'rspec'
          end
        RUBY

        context 'with TreatCommentsAsGroupSeparators: true' do
          let(:treat_comments_as_group_separators) { true }

          it 'accepts' 

        end

        context 'with TreatCommentsAsGroupSeparators: false' do
          it 'registers an offense' 


          it 'autocorrects' 

        end
      end
    end
  end

  include_examples :ordered_dependency, 'add_dependency' do
    let(:offense_message) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        spec.add_dependency 'rubocop'
        spec.add_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY

    let(:offense_message_with_multiline_comment) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        # For code quality
        spec.add_dependency 'rubocop'
        # For
        # test
        spec.add_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY
  end

  include_examples :ordered_dependency, 'add_runtime_dependency' do
    let(:offense_message) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        spec.add_runtime_dependency 'rubocop'
        spec.add_runtime_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY

    let(:offense_message_with_multiline_comment) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        # For code quality
        spec.add_runtime_dependency 'rubocop'
        # For
        # test
        spec.add_runtime_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY
  end

  include_examples :ordered_dependency, 'add_development_dependency' do
    let(:offense_message) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        spec.add_development_dependency 'rubocop'
        spec.add_development_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY

    let(:offense_message_with_multiline_comment) { <<-RUBY.strip_indent }
      Gem::Specification.new do |spec|
        # For code quality
        spec.add_development_dependency 'rubocop'
        # For
        # test
        spec.add_development_dependency 'rspec'
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{format(message, 'rspec', 'rubocop')}
      end
    RUBY
  end

  context 'When different dependencies are consecutive' do
    it 'does not register any offenses' 

  end
end

