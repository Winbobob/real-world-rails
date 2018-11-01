require 'spec_helper'

module Seahorse
  module Client
    describe PluginList do

      before(:each) do
        stub_const('Plugin1', Class.new)
        stub_const('Plugin2', Class.new)
      end

      class LazyPlugin
        def self.const_missing name
          const = Object.new
          const_set(name, const)
          const
        end
      end

      let(:plugins) { PluginList.new }

      it 'can be constructed with a list of plugins' 


      it 'can be seeded from another plugin list' 


      describe 'copy constructor' do

        it 'can be constructed from another plugin list' 


        it 'does not load plugins when constructing from another plugin list' 


      end

      describe '#add' do

        it 'adds a new plugin' 


        it 'accepts a plugin by name (String)' 


        it 'accepts a plugin by name (Symbol)' 


        it 'accepts a plugin object' 


        it 'only accpets one copy of each plugin' 


        it 'does not require plugins when added' 


        it 'requires prefixes from plugin names when loading' 


        it 'requires prefixes including dot from plugin names when loading' 


      end

      describe '#remove' do

        it 'removes the plugin' 


        it 'can remove a plugin added by name' 


      end

      describe '#set' do

        it 'replaces the existing list of plugins' 


      end

      describe '#each' do

        it 'is enumerable' 


      end

      describe 'thread safety' do

        class DummyMutex
          def initialize
            @was_locked = false
          end
          attr_reader :was_locked
          def synchronize(&block)
            @was_locked = true
            yield
          end
        end

        let(:mutex) { DummyMutex.new }
        let(:plugins) { PluginList.new([Plugin1], mutex: mutex) }

        it 'locks the mutex when adding a plugin' 


        it 'locks the mutex when removing a plugin' 


        it 'locks the mutex when enumerating plugins' 


      end
    end
  end
end

