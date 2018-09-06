require 'spec_helper'

describe Gitlab::QuickActions::Dsl do
  before :all do
    DummyClass = Struct.new(:project) do
      include Gitlab::QuickActions::Dsl # rubocop:disable RSpec/DescribedClass

      desc 'A command with no args'
      command :no_args, :none do
        "Hello World!"
      end

      params 'The first argument'
      explanation 'Static explanation'
      command :explanation_with_aliases, :once, :first do |arg|
        arg
      end

      desc do
        "A dynamic description for #{noteable.upcase}"
      end
      params 'The first argument', 'The second argument'
      command :dynamic_description do |args|
        args.split
      end

      command :cc

      explanation do |arg|
        "Action does something with #{arg}"
      end
      condition do
        project == 'foo'
      end
      command :cond_action do |arg|
        arg
      end

      parse_params do |raw_arg|
        raw_arg.strip
      end
      command :with_params_parsing do |parsed|
        parsed
      end

      params '<Comment>'
      substitution :something do |text|
        "#{text} Some complicated thing you want in here"
      end
    end
  end

  describe '.command_definitions' do
    it 'returns an array with commands definitions' 

  end
end

