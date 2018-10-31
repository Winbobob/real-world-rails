# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::HasManyOrHasOneDependent do
  subject(:cop) { described_class.new }

  context 'has_one' do
    it 'registers an offense when not specifying any options' 


    it 'registers an offense when missing an explicit `:dependent` strategy' 


    it 'does not register an offense when specifying `:dependent` strategy' 


    context 'with :through option' do
      it 'does not register an offense for non-nil value' 


      it 'registers an offense for nil value' 

    end

    context 'with_options dependent: :destroy' do
      it 'does not register an offense' 


      it 'does not register an offense for using `class_name` option' 

    end
  end

  context 'has_many' do
    it 'registers an offense when not specifying any options' 


    it 'registers an offense when missing an explicit `:dependent` strategy' 


    it 'does not register an offense when specifying `:dependent` strategy' 


    context 'with :through option' do
      it 'does not register an offense for non-nil value' 


      it 'registers an offense for nil value' 

    end

    context 'Surrounded `with_options` block' do
      it 'registers an offense when `dependent: :destroy` is not present' 


      it "doesn't register an offense for `with_options dependent: :destroy`" 


      context 'Multiple associations' do
        it "doesn't register an offense for " \
           '`with_options dependent: :destroy`' do
          expect_no_offenses(<<-RUBY.strip_indent)
            class Person
              with_options dependent: :destroy do
                has_many :foo
                has_many :bar
              end
            end
          RUBY
        end
      end
    end

    context 'Nested `with_options` block' do
      it 'does not register an offense when `dependent: :destroy` is present' 

    end
  end
end

