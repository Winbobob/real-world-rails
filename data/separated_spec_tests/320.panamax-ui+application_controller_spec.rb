require 'spec_helper'

describe ApplicationController do

  describe 'handling StandardError exceptions' do

    controller do
      def index
        raise StandardError, 'oops'
      end
    end

    it 'logs some info at the error level' 


    context 'when request is XHR' do

      before do
        allow(controller.request).to receive(:xhr?).and_return(true)
      end

      it 'returns a 500 status code' 


      it 'renders the error message in the response body' 

    end

    context 'when request is not XHR' do

      it 'redirects to the index' 


      it 'flashes an alert' 

    end
  end

  describe 'handling EOFError exceptions' do

    controller do
      def index
        raise EOFError, 'oops'
      end
    end

    context 'when request is XHR' do

      before do
        allow(controller.request).to receive(:xhr?).and_return(true)
      end

      it 'returns panamax API connection message in the response body' 

    end

    context 'when request is not XHR' do

      it 'flashes the panamax API connection message' 

    end
  end

  describe '#handle_exception' do

    context 'when the request is XHR' do

      before do
        allow(controller.request).to receive(:xhr?).and_return(true)
      end

      context 'when a message is provided' do

        controller do
          def index
            raise StandardError, 'oops'
          rescue => ex
            handle_exception(ex, message: 'uh-oh')
          end
        end

        it 'renders the provided message in the response body' 

      end

      context 'when a translated message key is provided' do

        controller do
          def index
            raise StandardError, 'oops'
          rescue => ex
            handle_exception(ex, message: :hello)
          end
        end

        it 'renders the translated message in the response body' 

      end
    end

    context 'when the request is not XHR' do

      context 'when a message is provided' do

        controller do
          def index
            raise StandardError, 'oops'
          rescue => ex
            handle_exception(ex, message: 'uh-oh')
          end
        end

        it 'flashes the provided message' 

      end

      context 'when a translated message key is provided' do

        controller do
          def index
            raise StandardError, 'oops'
          rescue => ex
            handle_exception(ex, message: :hello)
          end
        end

        it 'flashes the translated message' 

      end

      context 'when a redirect path is provided' do

        controller do
          def index
            raise StandardError, 'oops'
          rescue => ex
            handle_exception(ex, redirect: '/foo')
          end
        end

        it 'redirects to the specified path' 

      end
    end

  end
end

