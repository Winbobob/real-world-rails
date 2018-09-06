require 'unit_spec_helper'

describe Shoulda::Matchers::Independent::DelegateMethodMatcher do
  describe '#description' do
    context 'when the subject is an instance' do
      subject { Object.new }

      context 'without any qualifiers' do
        it 'states that it should delegate method to the right object' 

      end

      context 'qualified with #as' do
        it 'states that it should delegate method to the right object and method' 

      end

      context 'qualified with #with_arguments' do
        it 'states that it should delegate method to the right object with right argument' 

      end

      context 'qualified with #with_prefix' do
        context 'without arguments' do
          before do
            define_model('Country') do
              def hello; 'hello' end
            end
          end

          context "when the subject's delegating method also has a prefix" do
            it 'produces the correct description' 

          end
        end

        context 'as true' do
          before do
            define_model('Country') do
              def hello; 'hello' end
            end
          end

          context "when the subject's delegating method also has a prefix" do
            it 'produces the correct description' 

          end
        end

        context 'as a symbol/string' do
          it 'should delegate as (prefix_supplied)_(method_on_target)' 

        end
      end
    end

    context 'when the subject is a class' do
      subject { Object }

      context 'without any qualifiers' do
        it 'states that it should delegate method to the right object' 

      end

      context 'qualified with #as' do
        it 'states that it should delegate method to the right object and method' 

      end

      context 'qualified with #with_arguments' do
        it 'states that it should delegate method to the right object with right argument' 

      end
    end
  end

  it 'raises an error if the delegate object was never specified before matching' 


  context 'stubbing a delegating method on an instance' do
    it 'only happens temporarily and is removed after the match' 

  end

  context 'when the subject does not delegate anything' do
    before do
      define_class('PostOffice')
    end

    context 'when the subject is an instance' do
      it 'rejects with the correct failure message' 

    end

    context 'when the subject is a class' do
      it 'uses the proper syntax for class methods in errors' 

    end
  end

  context 'when the subject delegates correctly' do
    before do
      define_class('Mailman')

      define_class('PostOffice') do
        def deliver_mail
          mailman.deliver_mail
        end

        def mailman
          Mailman.new
        end
      end
    end

    it 'accepts' 


    context 'negating the matcher' do
      it 'rejects with the correct failure message' 

    end
  end

  context 'when the delegating method is private' do
    before do
      define_class('Mailman')

      define_class('PostOffice') do
        def deliver_mail
          mailman.deliver_mail
        end

        def mailman
          Mailman.new
        end

        private :mailman
      end
    end

    it 'accepts' 

  end

  context 'qualified with #with_arguments' do
    before do
      define_class('Mailman')

      define_class('PostOffice') do
        def deliver_mail(*args)
          mailman.deliver_mail('221B Baker St.', hastily: true)
        end

        def mailman
          Mailman.new
        end
      end
    end

    context 'qualified with #with_arguments' do
      context 'when the subject delegates with matching arguments' do
        it 'accepts' 


        context 'negating the matcher' do
          it 'rejects with the correct failure message' 

        end
      end

      context 'when not given the correct arguments' do
        it 'rejects with the correct failure message' 

      end
    end
  end

  context 'qualified with #as' do
    before do
      define_class(:mailman)

      define_class(:post_office) do
        def deliver_mail
          mailman.deliver_mail_and_avoid_dogs
        end

        def mailman
          Mailman.new
        end
      end
    end

    context "when the given method is the same as the subject's delegating method" do
      it 'accepts' 


      context 'negating the assertion' do
        it 'rejects with the correct failure message' 

      end
    end

    context "when the given method is not the same as the subject's delegating method" do
      it 'rejects with the correct failure message' 

    end
  end

  context 'qualified with #with_prefix' do
    context 'without arguments' do
      before do
        define_model('Country') do
          def hello; 'hello' end
        end
      end

      context "when the subject's delegating method also has a prefix" do
        it 'accepts' 

      end

      context "when the subject's delegating method does not have a prefix" do
        it 'rejects with the correct failure message' 

      end
    end

    context 'as true' do
      before do
        define_model('Country') do
          def hello; 'hello' end
        end
      end

      context "when the subject's delegating method also has a prefix" do
        it 'accepts' 

      end

      context "when the subject's delegating method does not have a prefix" do
        it 'rejects with the correct failure message' 

      end
    end

    context 'as a symbol/string' do
      before do
        define_model('Country') do
          def hello; 'hello' end
        end
      end

      context "when the subject's delegating method has the same prefix" do
        it 'accepts' 

      end

      context "when the subject's delegating method has a different prefix" do
        it 'rejects with the correct failure message' 

      end
    end
  end

  context 'qualified with #allow_nil' do
    context 'when using delegate from Rails' do
      context 'when delegations were defined with :allow_nil' do
        it 'accepts' 

      end

      context 'when delegations were not defined with :allow_nil' do
        it 'rejects with the correct failure message' 

      end
    end

    context 'when using Forwardable' do
      context 'when the delegate object is nil' do
        it 'rejects with the correct failure message' 

      end
    end

    context 'when delegating manually' do
      context 'when the delegating method accounts for the delegate object being nil' do
        it 'accepts' 

      end

      context 'when the delegating method does not account for the delegate object being nil' do
        it 'rejects with the correct failure message' 

      end
    end
  end
end

