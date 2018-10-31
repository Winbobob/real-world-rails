require "spec_helper"
require 'rspec/support/spec/in_sub_process'

RSpec.describe "Configuration" do
  include RSpec::Support::InSubProcess

  subject(:config) { RSpec::Core::Configuration.new }

  before do
    RSpec::Rails.initialize_configuration(config)
  end

  it "adds 'vendor/' to the backtrace exclusions" 


  it "adds 'lib/rspec/rails' to the backtrace exclusions" 


  shared_examples_for "adds setting" do |accessor, opts|
    opts ||= {}
    default_value = opts[:default]
    alias_setting = opts[:alias_with]
    query_method = "#{accessor}?".to_sym
    command_method = "#{accessor}=".to_sym

    specify "`##{query_method}` is `#{default_value.inspect}` by default" do
      expect(config.send(query_method)).to be(default_value)
    end

    describe "`##{command_method}`" do
      it "changes `#{query_method}` to the provided value" 


      it "sets `#{accessor}` to the provided value" 

    end

    if alias_setting
      specify "`##{alias_setting}` is an alias for `#{accessor}`" do
        expect {
          config.send(command_method, :a_value)
        }.to change { config.send(alias_setting) }.to(:a_value)
      end
    end
  end

  context "adds settings" do
    include_examples "adds setting",
                     :infer_base_class_for_anonymous_controllers,
                     :default => true

    include_examples "adds setting",
                     :use_transactional_fixtures,
                     :alias_with => :use_transactional_examples

    include_examples "adds setting", :use_instantiated_fixtures

    include_examples "adds setting", :global_fixtures

    include_examples "adds setting", :fixture_path

    include_examples "adds setting", :rendering_views

    specify "`#render_views?` is falsey by default" do
      expect(config.render_views?).to be_falsey
    end

    specify "`#render_views` sets `render_views?` to `true`" do
      expect {
        config.render_views
      }.to change { config.render_views? }.to be(true)
    end

    describe "`#render_views=`" do
      it "sets `render_views?` to the provided value" 


      it "sets `render_views` to the provided value" 

    end
  end

  specify "#filter_rails_from_backtrace! adds exclusion patterns for rails gems" do
    config.filter_rails_from_backtrace!

    gems = %w[
      actionmailer
      actionpack
      actionview
      activemodel
      activerecord
      activesupport
      activejob
    ]
    exclusions = config.backtrace_exclusion_patterns.map(&:to_s)
    aggregate_failures do
      gems.each { |gem| expect(exclusions).to include(/#{gem}/) }
    end
  end

  describe "#infer_spec_type_from_file_location!" do
    def in_inferring_type_from_location_environment
      in_sub_process do
        RSpec.configuration.infer_spec_type_from_file_location!
        yield
      end
    end

    shared_examples_for "infers type from location" do |type, location|
      it "sets the type to `#{type.inspect}` for file path `#{location}`" 

    end

    include_examples "infers type from location",
                     :controller,
                     "spec/controllers"
    include_examples "infers type from location", :helper, "spec/helpers"
    include_examples "infers type from location", :mailer, "spec/mailers"
    include_examples "infers type from location", :model, "spec/models"
    include_examples "infers type from location", :request, "spec/requests"
    include_examples "infers type from location", :request, "spec/integration"
    include_examples "infers type from location", :request, "spec/api"
    include_examples "infers type from location", :routing, "spec/routing"
    include_examples "infers type from location", :view, "spec/views"
    include_examples "infers type from location", :feature, "spec/features"
  end

  it "fixture support is included with metadata `:use_fixtures`" 


  it "metadata `:type => :controller` sets up controller example groups" 


  it "metadata `:type => :helper` sets up helper example groups" 


  it "metadata `:type => :model` sets up model example groups" 


  it "metadata `:type => :request` sets up request example groups" 


  it "metadata `:type => :routing` sets up routing example groups" 


  it "metadata `:type => :view` sets up view example groups" 


  it "metadata `:type => :feature` sets up feature example groups" 


  if defined?(ActionMailer)
    it "metadata `:type => :mailer` sets up mailer example groups" 

  end

  if ::Rails::VERSION::STRING > '5'
    it "has a default #file_fixture_path of 'spec/fixtures/files'" 

  end
end

