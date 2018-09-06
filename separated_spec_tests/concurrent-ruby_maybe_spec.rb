module Concurrent

  RSpec.describe Maybe do

    context 'construction' do

      it 'hides Maybe.new' 


      context 'Maybe.from' do

        it 'raises an exception when no block is given' 


        it 'passes all arguments to the block' 


        it 'creates a Just Maybe on success' 


        it 'sets the value to the block result on success' 


        it 'creates a Nothing Maybe on exception' 


        it 'sets the reason to the error object on exception' 

      end

      context 'Maybe.just' do

        let!(:value) { 42 }
        subject { Maybe.just(value) }

        it 'creates a new  Just Maybe' 

      end

      context 'Maybe.nothing' do

        let!(:error) { StandardError.new }
        subject { Maybe.nothing(error) }

        it 'creates a new Nothing Maybe' 


        it 'uses the given Error object' 


        it 'creates a new error object with the given string' 


        it 'creates a new error object when given nothing' 

      end
    end

    context 'when just' do

      let!(:value) { 42 }
      subject { Maybe.just(value) }

      specify '#just? returns true' do
        expect(subject).to be_just
      end

      specify '#fulfilled? returns true' do
        expect(subject).to be_fulfilled
      end

      specify '#nothing? returns false' do
        expect(subject).to_not be_nothing
      end

      specify '#rejected? returns false' do
        expect(subject).to_not be_rejected
      end

      specify '#just returns the value' do
        expect(subject.just).to eq value
      end

      specify '#value returns the value' do
        expect(subject.value).to eq value
      end

      specify '#nothing returns NONE' do
        expect(subject.nothing).to be Maybe::NONE
      end

      specify '#reason returns NONE' do
        expect(subject.reason).to be Maybe::NONE
      end
    end

    context 'when nothing' do

      let!(:error) { StandardError.new }
      subject { Maybe.nothing(error) }

      specify '#just? returns false' do
        expect(subject).to_not be_just
      end

      specify '#fulfilled? returns false' do
        expect(subject).to_not be_fulfilled
      end

      specify '#nothing? returns true' do
        expect(subject).to be_nothing
      end

      specify '#rejected? returns true' do
        expect(subject).to be_rejected
      end

      specify '#just returns NONE' do
        expect(subject.just).to eq Maybe::NONE
      end

      specify '#value returns NONE' do
        expect(subject.value).to eq Maybe::NONE
      end

      specify '#nothing returns the raised error' do
        expect(subject.nothing).to be error
      end

      specify '#reason returns the raised error' do
        expect(subject.reason).to be error
      end
    end

    context 'comparison' do

      let!(:something_big)   { Maybe.just(42) }
      let!(:something_small) { Maybe.just(1) }
      let!(:nothing_big)     { Maybe.nothing(StandardError.new) }
      let!(:nothing_small)   { Maybe.nothing(ArgumentError.new) }

      specify 'something is not equal to nothing' do
        expect(something_big).to_not eq nothing_big
      end

      specify 'nothing is equal to nothing' do
        expect(nothing_big).to eq nothing_small
      end

      specify 'something is equal to the same value' do
        first = Maybe.just(42)
        second = Maybe.just(42)
        expect(first).to eq second
      end

      specify 'something is not equal to a different value' do
        expect(something_big).to_not eq something_small
      end

      specify 'something is greater than a smaller value' do
        expect(something_big).to be > something_small
        expect(something_big).to be >= something_small
      end

      specify 'something is less than a bigger value' do
        expect(something_small).to be < something_big
        expect(something_small).to be <= something_big
      end

      specify 'nothing is not less than nothing' do
        expect(nothing_small).to_not be < nothing_big
      end

      specify 'nothing is not greater than nothing' do
        expect(nothing_big).to_not be > nothing_small
      end
    end

    context '#or' do

      it 'returns the value when something' 


      it 'returns the other when nothing' 

    end
  end
end

