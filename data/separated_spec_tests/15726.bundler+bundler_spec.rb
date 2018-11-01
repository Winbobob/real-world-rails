# frozen_string_literal: true

RSpec.describe "bundle install" do
  describe "with bundler dependencies" do
    before(:each) do
      build_repo2 do
        build_gem "rails", "3.0" do |s|
          s.add_dependency "bundler", ">= 0.9.0.pre"
        end
        build_gem "bundler", "0.9.1"
        build_gem "bundler", Bundler::VERSION
      end
    end

    it "are forced to the current bundler version" 


    it "are not added if not already present" 


    it "causes a conflict if explicitly requesting a different version" 


    it "works for gems with multiple versions in its dependencies" 


    it "includes bundler in the bundle when it's a child dependency" 


    it "allows gem 'bundler' when Bundler is not in the Gemfile or its dependencies" 


    it "causes a conflict if child dependencies conflict" 


    it "causes a conflict if a child dependency conflicts with the Gemfile" 


    it "can install dependencies with newer bundler version with system gems", :ruby => "> 2" 


    it "can install dependencies with newer bundler version with a local path", :ruby => "> 2" 


    context "with allow_bundler_dependency_conflicts set" do
      before { bundle! "config allow_bundler_dependency_conflicts true" }

      it "are forced to the current bundler version with warnings when no compatible version is found" 

    end
  end
end

