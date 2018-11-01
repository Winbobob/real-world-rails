require_relative '../../spec_helper'
require 'ostruct'

module Seahorse
  module Client
    describe Plugin do

      let(:handlers) { HandlerList.new }

      let(:plugin) { Class.new(Plugin) }

      let(:config) { Configuration.new }

      it 'is a HandlerBuilder' 


      describe '#add_options' do

        it 'adds options registered by .option' 


      end

      describe '#add_handlers' do

        it 'does nothing by default' 


        it 'adds handlers registered by .handler' 


      end

      describe '.option' do

        it 'provides a short-cut method for adding options' 


        it 'accepts a static default value' 


        it 'accepts a default value as a block' 
        it 'accepts a default block value and yields the config' 


      end

      describe '.before_initialize' do

        it 'yeilds the client class and constructor options to the plugin' 


      end

      describe '.after_initialize' do

        it 'yieldes the fully constructed client to the plugin' 


      end
    end
  end
end

