require 'rails_helper'
require_dependency 'plugin/instance'

describe Plugin::Instance do

  after do
    DiscoursePluginRegistry.reset!
  end

  context "find_all" do
    it "can find plugins correctly" 


    it "does not blow up on missing directory" 

  end

  context "enabling/disabling" do

    it "is enabled by default" 


    context "with a plugin that extends things" do

      class Trout; end
      class TroutSerializer < ApplicationSerializer; end

      class TroutPlugin < Plugin::Instance
        attr_accessor :enabled
        def enabled?; @enabled; end
      end

      before do
        @plugin = TroutPlugin.new
        @trout = Trout.new

        # New method
        @plugin.add_to_class(:trout, :status?) { "evil" }

        # DiscourseEvent
        @hello_count = 0
        @increase_count = -> { @hello_count += 1 }
        @set = @plugin.on(:hello, &@increase_count)

        # Serializer
        @plugin.add_to_serializer(:trout, :scales) { 1024 }
        @serializer = TroutSerializer.new(@trout)
      end

      after do
        DiscourseEvent.off(:hello, &@set.first)
      end

      it "checks enabled/disabled functionality for extensions" 

    end
  end

  context "register asset" do
    it "populates the DiscoursePluginRegistry" 


    it "remaps vendored_core_pretty_text asset" 

  end

  context "register service worker" do
    it "populates the DiscoursePluginRegistry" 

  end

  context "activate!" do
    it "can activate plugins correctly" 


    it "finds all the custom assets" 

  end

  context "serialized_current_user_fields" do
    before do
      DiscoursePluginRegistry.serialized_current_user_fields << "has_car"
    end

    after do
      DiscoursePluginRegistry.serialized_current_user_fields.delete "has_car"
    end

    it "correctly serializes custom user fields" 

  end

  context "register_color_scheme" do
    it "can add a color scheme for the first time" 


    it "doesn't add the same color scheme twice" 

  end

  describe '.register_seedfu_fixtures' do
    it "should add the new path to SeedFu's fixtures path" 

  end

  describe '#add_model_callback' do
    let(:metadata) do
      metadata = Plugin::Metadata.new
      metadata.name = 'test'
      metadata
    end

    let(:plugin_instance) do
      plugin = Plugin::Instance.new(nil, "/tmp/test.rb")
      plugin.metadata = metadata
      plugin
    end

    it 'should add the right callback' 


    it 'should add the right callback with options' 

  end

  context "locales" do
    let(:plugin_path) { "#{Rails.root}/spec/fixtures/plugins/custom_locales" }
    let!(:plugin) { Plugin::Instance.new(nil, "#{plugin_path}/plugin.rb") }
    let(:plural) do
      {
        keys: [:one, :few, :other],
        rule: lambda do |n|
          return :one if n == 1
          return :few if n < 10
          :other
        end
      }
    end

    def register_locale(locale, opts)
      plugin.register_locale(locale, opts)
      plugin.activate!

      DiscoursePluginRegistry.locales[locale]
    end

    it "enables the registered locales only on activate" 


    it "allows finding the locale by string and symbol" 


    it "correctly registers a new locale" 


    it "correctly registers a new locale using a fallback locale" 


    it "correctly registers a new locale when some files exist in core" 


    it "does not register a new locale when the fallback locale does not exist" 


    [
      "config/locales/client.foo.yml",
      "config/locales/server.foo.yml",
      "lib/javascripts/locale/message_format/foo.js",
      "lib/javascripts/locale/moment_js/foo.js",
      "assets/locales/foo.js.erb"
    ].each do |path|
      it "does not register a new locale when #{path} is missing" 

    end
  end

  describe '#enabled_site_setting_filter' do
    describe 'when filter is blank' do
      it 'should return the right value' 

    end

    it 'should set the right value' 

  end

end

