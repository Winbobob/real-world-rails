require_relative '../../spec_helper'
require 'tempfile'
require 'pathname'

module Seahorse
  module Client
    describe Request do

      let(:handlers) { HandlerList.new }

      let(:context) { RequestContext.new }

      let(:request) { Request.new(handlers, context) }

      it 'is a HandlerBuilder' 


      describe '#handlers' do

        it 'returns the handler list' 


      end

      describe '#context' do

        it 'returns the request context given the constructor' 


      end

      describe '#send_request' do

        it 'contructs a stack from the handler list' 


        it 'returns the response from the handler stack #call method' 


        it 'passes the request context to the handler stack' 


        it 'returns the response from the handler stack' 


      end

      describe '#send_request with a target' do

        let(:handler) do
          Proc.new do
            context.http_response.signal_headers(200, {})
            context.http_response.signal_data('part1')
            context.http_response.signal_data('part2')
            context.http_response.signal_data('part3')
            context.http_response.signal_done
            Response.new(context: context)
          end
        end

        before(:each) do
          handlers.add(Plugins::ResponseTarget::Handler, step: :initialize)
          handlers.add(double('send-handler-class', new: handler))
        end

        describe 'String target' do

          it 'writes to the file named' 


          it 'closes the file before returning the response' 


        end

        describe 'Pathname target' do

          it 'writes to the file named' 


          it 'closes the file before returning the response' 


        end

        describe 'IO object target' do

          it 'writes to the given object' 


        end

        describe 'target from params' do

          it 'writes the response to the optional :response_target param' 


        end

        describe 'Block target' do

          it 'streams data from the handler to the #send_request block' 


          it 'counts the bytes yielded' 


          it 'does not buffer the response chunks' 


          describe '2xx responses, not 200' do

            let(:handler) do
              Proc.new do
                context.http_response.signal_headers(206, {})
                context.http_response.signal_data('part1')
                context.http_response.signal_data('part2')
                context.http_response.signal_data('part3')
                context.http_response.signal_done
                Response.new(context: context)
              end
            end

            it 'streams data from the handler to the #send_request block' 


          end
        end
      end
    end
  end
end

