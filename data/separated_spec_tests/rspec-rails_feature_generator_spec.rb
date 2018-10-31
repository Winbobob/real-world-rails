# Generators are not automatically loaded by rails
require 'generators/rspec/feature/feature_generator'
require 'support/generators'

RSpec.describe Rspec::Generators::FeatureGenerator, :type => :generator do
  setup_default_destination

  describe 'feature specs' do
    describe 'are generated independently from the command line' do
      before do
        run_generator %w(posts)
      end
      describe 'the spec' do
        subject(:feature_spec) { file('spec/features/posts_spec.rb') }
        it "exists" 

        it "contains 'rails_helper'" 

        it "contains the feature" 

      end
    end

    describe 'are singularized appropriately with the --singularize flag' do
      before do
        run_generator %w(posts --singularize)
      end
      describe 'the spec' do
        subject(:feature_spec) { file('spec/features/post_spec.rb') }
        it "exists with the appropriate filename" 

        it "contains the singularized feature" 

      end
    end

    describe "are not generated" do
      before do
        run_generator %w(posts --no-feature-specs)
      end
      describe "the spec" do
        subject(:feature_spec) { file('spec/features/posts_spec.rb') }
        it "does not exist" 

      end
    end
  end
end

