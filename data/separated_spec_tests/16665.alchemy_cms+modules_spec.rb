# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  class ModulesTestController < ApplicationController
    include Modules
  end

  describe Modules do
    let(:controller) { ModulesTestController.new }

    let(:alchemy_modules) do
      YAML.load_file(File.expand_path('../../config/alchemy/modules.yml', __dir__))
    end

    describe '#module_definition_for' do
      subject { controller.module_definition_for(name) }

      let(:dashboard_module) { alchemy_modules.first }

      context 'with a string given as name' do
        let(:name) { 'dashboard' }

        it "returns the module definition" 

      end

      context 'with a hash given as name' do
        let(:controller_name) { 'alchemy/admin/dashboard' }
        let(:name)            { {controller: controller_name, action: 'index'} }

        it "returns the module definition" 


        context 'with leading slash in controller name' do
          let(:controller_name) { '/alchemy/admin/dashboard' }

          it "returns the module definition" 

        end
      end

      context 'with nil given as name' do
        let(:name) { nil }
        it 'raises an error' 

      end
    end

    describe '.register_module' do
      let(:alchemy_module) do
        {
          'name' => 'module',
          'navigation' => {
            'controller' => 'register_module_dummy',
            'action' => 'index'
          }
        }
      end

      let(:bad_alchemy_module_a) do
        {
          'name' => 'bad_module_a',
          'navigation' => {
            'controller' => 'bad_module',
            'action' => 'index'
          }
        }
      end

      let(:bad_alchemy_module_b) do
        {
          'name' => 'bad_module_b',
          'navigation' => {
            'controller' => 'register_module_dummy',
            'action' => 'index',
            'sub_navigation' => [{
              'controller' => 'bad_module',
              'action' => 'index'
            }]
          }
        }
      end

      it "registers a module definition into global list of modules" 


      it "fails to register a module when a matching navigation controller cannot be found" 


      it "fails to register a module when a matching sub_navigation controller cannot be found" 

    end
  end
end

