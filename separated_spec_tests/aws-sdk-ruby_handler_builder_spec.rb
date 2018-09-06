require_relative '../../spec_helper'
require 'ostruct'

module Seahorse
  module Client
    describe HandlerBuilder do

      let(:klass) {
        Class.new do

          include HandlerBuilder

          def initialize
            @handlers = HandlerList.new
          end

          attr_reader :handlers

        end
      }

      let(:obj) { klass.new }

      describe '#handler' do

        it 'registers a handler' 


        it 'accepts a step option' 


        it 'builds a handler from a block' 


        it 'accepts a step with the block' 


        it 'returns the handler class' 


      end

      describe '#handle_request' do

        it 'passes the context to the block' 


        it 'calls the next handler in the stack reguardless of the return' 


      end

      describe '#handle_response' do

        it 'is called when the response is signaled complete' 


        it 'is not called if the response is not signaled complete' 


      end

      describe 'naming handlers inside modules' do

        let(:mod) {
          Module.new do
            extend HandlerBuilder
            def self.handlers
              @handlers ||= HandlerList.new
            end
          end
        }

        it 'assigns the handler to a constant if a name is given' 


        it 'accepts the handler name as a symbol' 


        it 'accepts a name and options at the same time' 


        it 'can assign a name when calling handle_request' 


        it 'can assign a name when calling handle_response' 


      end
    end
  end
end

