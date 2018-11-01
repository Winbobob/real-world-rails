require 'spec_helper'

describe Spree::ServiceModule do
  context 'noncallable thing passed to run' do
    class ServiceObjectWithUncallableThing
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run 'something_crazy'
      end
    end

    it 'raises NonCallablePassedToRun' 

  end

  context 'unimplemented method' do
    class ServiceObjectWithMissingMethod
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :non_existing_method
      end
    end

    it 'raises MethodNotImplemented' 


    it 'returns message in exception' 

  end

  context 'non wrapped value' do
    class ServiceObjectWithNonWrappedReturn
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :first_method
        run :second_method
      end

      private

      def first_method(_params)
        'not wrapped return'
      end

      def second_method(params); end
    end

    it 'raises WrongDataPassed' 


    it 'returns message in exception' 

  end

  context 'non wrapped value in last method' do
    class ServiceObjectWithNonWrappedReturn
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :first_method
      end

      private

      def first_method(_params)
        'not wrapped return'
      end
    end

    it 'raises WrongDataPassed' 

  end

  context 'first method failed' do
    class ServiceObjectWithFailure
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :first_method
        run :second_method
      end

      private

      def first_method(_params)
        failure('Failed!')
      end

      def second_method(_params)
        success('Success!')
      end
    end

    it 'returns result with success? false' 


    it 'returns result with failure? true' 


    it 'returns value from first failed method' 


    it 'returns result which is instance of Result' 


    it "doesn't call second method" 


    it 'returns Result instance' 

  end

  context 'success' do
    class ServiceObjectWithSuccess
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :first_method
        run :second_method
      end

      private

      def first_method(_params)
        success('First Method Success!')
      end

      def second_method(params)
        success(params + ' Second Method Success!')
      end
    end

    it 'returns result with success? true' 


    it 'returns result with failure? false' 


    it 'returns value from last method' 


    it 'calls second method' 


    it 'passes input from call to first run method' 


    it 'passes empty hash if input was not provided' 

  end

  context 'not compatible params passed as result' do
    class ServiceObjectWithIncompatibleParams
      prepend ::Spree::ServiceModule::Base

      def call(_params)
        run :first_method
        run :second_method
      end

      private

      def first_method(_params)
        success(first_value: 'asd', second_value: 'qwe')
      end

      def second_method(first_value:)
        success(first_value + ' Second Method Success!')
      end
    end

    it 'raises exception' 

  end
end

