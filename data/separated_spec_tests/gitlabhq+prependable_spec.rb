# frozen_string_literal: true

require 'fast_spec_helper'

# Patching ActiveSupport::Concern
require_relative '../../../../config/initializers/0_as_concern'

describe Gitlab::Patch::Prependable do
  before do
    @prepended_modules = []
  end

  let(:ee) do
    # So that block in Module.new could see them
    prepended_modules = @prepended_modules

    Module.new do
      extend ActiveSupport::Concern

      class_methods do
        def class_name
          super.tr('C', 'E')
        end
      end

      this = self
      prepended do
        prepended_modules << [self, this]
      end

      def name
        super.tr('c', 'e')
      end
    end
  end

  let(:ce) do
    # So that block in Module.new could see them
    prepended_modules = @prepended_modules
    ee_ = ee

    Module.new do
      extend ActiveSupport::Concern
      prepend ee_

      class_methods do
        def class_name
          'CE'
        end
      end

      this = self
      prepended do
        prepended_modules << [self, this]
      end

      def name
        'ce'
      end
    end
  end

  describe 'a class including a concern prepending a concern' do
    subject { Class.new.include(ce) }

    it 'returns values from prepended module ee' 


    it 'has the expected ancestors' 


    it 'prepends only once even if called twice' 


    context 'overriding methods' do
      before do
        subject.module_eval do
          def self.class_name
            'Custom'
          end

          def name
            'custom'
          end
        end
      end

      it 'returns values from the class' 

    end
  end

  describe 'a class prepending a concern prepending a concern' do
    subject { Class.new.prepend(ce) }

    it 'returns values from prepended module ee' 


    it 'has the expected ancestors' 


    it 'prepends only once' 

  end

  describe 'a class prepending a concern' do
    subject do
      ee_ = ee

      Class.new do
        prepend ee_

        def self.class_name
          'CE'
        end

        def name
          'ce'
        end
      end
    end

    it 'returns values from prepended module ee' 


    it 'has the expected ancestors' 


    it 'prepends only once' 

  end

  describe 'simple case' do
    subject do
      foo_ = foo

      Class.new do
        prepend foo_

        def value
          10
        end
      end
    end

    let(:foo) do
      Module.new do
        extend ActiveSupport::Concern

        prepended do
          def self.class_value
            20
          end
        end

        def value
          super * 10
        end
      end
    end

    context 'class methods' do
      it "has a method" 


      it 'can execute a method' 

    end

    context 'instance methods' do
      it "has a method" 


      it 'chains a method execution' 

    end
  end

  context 'having two prepended blocks' do
    subject do
      Module.new do
        extend ActiveSupport::Concern

        prepended do
        end

        prepended do
        end
      end
    end

    it "raises an error" 

  end
end

