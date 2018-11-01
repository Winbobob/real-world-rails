describe Excon::Connection do
  include_context('stubs')
  describe 'validating parameters' do
    class FooMiddleware < Excon::Middleware::Base
      def self.valid_parameter_keys
        [:foo]
      end
    end

    let(:foo_stack) do
      Excon.defaults[:middlewares] + [FooMiddleware]
    end

    def expect_parameter_warning(validation, key)
      expect { yield }.to raise_error(Excon::Error::Warning, "Invalid Excon #{validation} keys: #{key.inspect}")
    end

    context 'with default middleware' do
      it 'Connection.new warns on invalid parameter keys' 


      it 'Connection#request warns on invalid parameter keys' 

    end

    context 'with custom middleware at instantiation' do
      it 'Connection.new accepts parameters that are valid for the provided middleware' 


      it 'Connection.new warns on parameters that are not valid for the provided middleware' 


      it 'Connection#request accepts parameters that are valid for the provided middleware' 


      it 'Connection#request warns on parameters that are not valid for the provided middleware' 

    end

    context 'with custom middleware at request time' do
      it 'Connection#request accepts parameters that are valid for the provided middleware' 


      it 'Connection#request warns on parameters that are not valid for the request middleware' 


      it 'Connection#request warns on parameters from instantiation that are not valid for the request middleware' 

    end
  end
end

