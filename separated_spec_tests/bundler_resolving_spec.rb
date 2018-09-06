# frozen_string_literal: true

RSpec.describe "bundle install with install-time dependencies" do
  it "installs gems with implicit rake dependencies" 


  it "installs gems with a dependency with no type" 


  describe "with crazy rubygem plugin stuff" do
    it "installs plugins" 


    it "installs plugins depended on by other plugins" 


    it "installs multiple levels of dependencies" 


    context "with ENV['DEBUG_RESOLVER'] set" do
      it "produces debug output" 

    end

    context "with ENV['DEBUG_RESOLVER_TREE'] set" do
      it "produces debug output" 

    end
  end

  describe "when a required ruby version" do
    context "allows only an older version" do
      it "installs the older version" 

    end

    context "allows no gems" do
      before do
        build_repo2 do
          build_gem "require_ruby" do |s|
            s.required_ruby_version = "> 9000"
          end
        end
      end

      let(:ruby_requirement) { %("#{RUBY_VERSION}") }
      let(:error_message_requirement) { "~> #{RUBY_VERSION}.0" }

      shared_examples_for "ruby version conflicts" do
        it "raises an error during resolution" 

      end

      it_behaves_like "ruby version conflicts"

      describe "with a < requirement" do
        let(:ruby_requirement) { %("< 5000") }
        let(:error_message_requirement) { "< 5000" }

        it_behaves_like "ruby version conflicts"
      end

      describe "with a compound requirement" do
        let(:reqs) { ["> 0.1", "< 5000"] }
        let(:ruby_requirement) { reqs.map(&:dump).join(", ") }
        let(:error_message_requirement) { Gem::Requirement.new(reqs).to_s }

        it_behaves_like "ruby version conflicts"
      end
    end
  end

  describe "when a required rubygems version disallows a gem" do
    it "does not try to install those gems" 

  end
end

