require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::SetSessionOrFlashMatcher do
  context 'without any qualifiers' do
    it 'produces the right description' 


    context 'in the positive' do
      context 'if the store is not empty' do
        it 'accepts' 

      end

      context 'if the store is empty' do
        it 'rejects' 


        it 'produces the correct failure message' 

      end
    end

    context 'in the negative' do
      context 'if the given key is present in the store' do
        it 'produces the correct failure message' 

      end
    end
  end

  context 'with #[]' do
    it 'produces the right description' 


    context 'in the positive' do
      context 'if the given key is present in the store' do
        it 'accepts' 

      end

      context 'if the given key is not present in the store' do
        it 'rejects' 


        it 'produces the correct failure message' 

      end
    end

    context 'in the negative' do
      context 'if the given key is present in the store' do
        it 'produces the correct failure message' 

      end
    end
  end

  context 'with #to' do
    context 'given a static value' do
      it 'produces the right description' 


      context 'in the positive' do
        context 'if the given value is present in the store' do
          it 'accepts' 


          it 'accepts given a value of nil' 


          it 'accepts given a value of false' 

        end

        context 'if the given value is not present in the store' do
          it 'rejects' 


          it 'produces the correct failure message' 

        end
      end

      context 'in the negative' do
        context 'if the given value is present in the store' do
          it 'produces the correct failure message' 

        end
      end
    end

    context 'given a regexp' do
      it 'produces the right description' 


      context 'in the positive' do
        context 'if the given value is present in the store' do
          it 'accepts' 

        end

        context 'if the given value is not present in the store' do
          it 'rejects' 


          it 'produces the correct failure message' 

        end
      end

      context 'in the negative' do
        context 'if the given value is present in the store' do
          it 'produces the correct failure message' 

        end
      end
    end

    context 'given a dynamic value' do
      it 'produces the right description' 


      it 'requires in_context to be specified beforehand' 


      context 'in the positive' do
        context 'if the value evaluated in the context is present in the store' do
          it 'accepts' 

        end

        context 'if the value evaluated in the context is not present in the store' do
          it 'rejects' 


          it 'produces the correct failure message' 

        end
      end

      context 'in the negative' do
        context 'if the value evaluated in the context is present in the store' do
          it 'produces the correct failure message' 

        end
      end
    end
  end

  context 'with #[] + #to' do
    context 'given a static value' do
      it 'produces the right description' 


      context 'in the positive' do
        context 'if the given value is present in the store' do
          it 'accepts' 

        end

        context 'if the given value is not present in the store' do
          it 'rejects' 


          it 'produces the correct failure message' 

        end
      end

      context 'in the negative' do
        context 'if the given value is present in the store' do
          it 'produces the correct failure message' 

        end
      end
    end

    context 'given a dynamic value' do
      it 'produces the right description' 


      context 'in the positive' do
        context 'if the value evaluated in the context is present in the store' do
          it 'accepts' 

        end

        context 'if the value evaluated in the context is not present in the store' do
          it 'rejects' 


          it 'produces the correct failure message' 

        end
      end

      context 'in the negative' do
        context 'if the value evaluated in the context is present in the store' do
          it 'produces the correct failure message' 

        end
      end
    end
  end

  def build_store(overrides = {})
    defaults = {
      :name => 'store',
      :controller= => nil,
      :has_key? => nil,
      :has_value? => nil,
      :empty? => nil,
    }
    methods = defaults.merge(overrides)
    double('store', methods)
  end
end

