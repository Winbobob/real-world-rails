require 'spec_helper'

module Refinery
  module RefineryRspec
    class Engine < ::Rails::Engine
      isolate_namespace ::Refinery
      ::Refinery::Plugin.register do |plugin|
        plugin.name = 'refinery_rspec'
        plugin.hide_from_menu = true
      end
    end
  end
end

module Refinery
  RSpec.describe Plugin do

    let(:plugin) { ::Refinery::Plugins.registered.detect { |plugin| plugin.name == 'refinery_rspec' } }

    before do
      ::I18n.backend.store_translations :en, :refinery => {
        :plugins => {
          :refinery_rspec => {
            :title => "Refinery CMS RSpec",
            :description => "RSpec tests for plugin.rb"
          }
        }
      }
    end

    describe '.register' do
      it 'must have a name' 

    end

    describe '#class_name' do
      it 'returns class name' 

    end

    describe '#title' do
      it 'returns plugin title defined by I18n' 

    end

    describe '#description' do
      it 'returns plugin description defined by I18n' 

    end

    describe '#pathname' do
      it 'should be set by default' 

    end

    describe '#pathname=' do
      it 'converts string input to pathname' 


      it 'overrides the default pathname' 

    end

    describe '#always_allow_access' do
      it 'returns false if @always_allow_access is not set or its set to false' 


      it 'returns true if set so' 

    end

    describe '#menu_match' do
      it 'returns regexp based on plugin name' 

    end

    describe '#highlighted?' do
      it 'returns true if params[:controller] match menu_match regexp' 

    end

    describe '#url' do
      class Plugin
        def reset_url!
          @url = nil
        end
      end

      before { plugin.reset_url! }

      context 'when @url is already defined' do
        it 'returns hash' 

      end

      context 'when controller is present' do
        it 'returns hash based on it' 

      end

      context 'when directory is present' do

        it 'returns hash based on it' 

      end

      context 'when controller and directory not present' do
        it 'returns hash based on plugins name' 

      end
    end


    describe "#landable?" do
      context "when hidden from menu" do
        before do
          allow(plugin).to receive(:hide_from_menu).and_return(true)
        end

        it "is false" 

      end

      context "when not hidden from menu" do
        before do
          allow(plugin).to receive(:hide_from_menu).and_return(false)
        end

        context "when has url" do
          before do
            allow(plugin).to receive(:url).and_return("/blah")
          end

          it "is true" 

        end

        context "when doesn't have url" do
          before do
            allow(plugin).to receive(:url).and_return(nil)
          end

          it "is false" 

        end
      end
    end
  end
end

