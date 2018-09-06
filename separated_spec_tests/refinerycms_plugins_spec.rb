require 'spec_helper'

module Refinery
  module MyPlugin
    class Engine < ::Rails::Engine
      isolate_namespace ::Refinery
      ::Refinery::Plugin.register do |plugin|
        plugin.name = "my_plugin"
        plugin.hide_from_menu = true
      end
    end
  end

  module MyOtherPlugin
    class Engine < ::Rails::Engine
      isolate_namespace ::Refinery
      ::Refinery::Plugin.register do |plugin|
        plugin.name = "my_other_plugin"
        plugin.hide_from_menu = true
      end
    end
  end

  ::I18n.backend.store_translations :en, :refinery => {
    :plugins => {
      :my_plugin => {
        :title => "my plugin"
      },
      :my_other_plugin => {
        :title => "my other plugin"
      }
    }
  }

  RSpec.describe Plugins do
    def mock_plugin(name)
      ::Refinery::Plugin.new.tap do |plugin|
        plugin.name = name
      end
    end

    describe '#registered' do
      it 'identifies as Refinery::Plugins' 

    end

    describe '#always_allowed' do
      it 'should identify as Refinery::Plugins' 


      it 'only contains items that are always allowed' 

    end

    describe '#in_menu' do
      it 'identifies as Refinery::Plugins' 


      it 'only contains items that are in the menu' 


      it "orders by plugin_priority config" 

    end

    describe ".find_by_name" do
      it "finds plugin by given name" 

    end

    describe ".find_by_title" do
      it "finds plugin by given title" 

    end

    describe ".first_in_menu_with_url" do
      it "finds plugins that are landable" 

    end

  end
end

