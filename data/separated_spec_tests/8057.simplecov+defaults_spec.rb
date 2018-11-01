# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov do
    skip "requires the default configuration" if ENV["SIMPLECOV_NO_DEFAULTS"]

    context "profiles" do
      let(:config_class) do
        Class.new do
          include SimpleCov::Configuration

          def load_profile(name)
            configure(&SimpleCov.profiles[name.to_sym])
          end
        end
      end

      let(:config) { config_class.new }

      def filtered?(config, filename)
        path = File.join(SimpleCov.root, filename)
        file = SimpleCov::SourceFile.new(path, [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil])
        config.filters.any? { |filter| filter.matches?(file) }
      end

      it "provides a sensible test_frameworks profile" 


      it "provides a sensible rails profile" 

    end
  end
end

