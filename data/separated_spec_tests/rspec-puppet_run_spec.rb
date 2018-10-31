require 'spec_helper'

describe RSpec::Puppet::FunctionMatchers::Run do
  let (:wrapper) { double("function wrapper") }

  before :each do
    expect(wrapper).to receive(:call).never
  end

  it 'should call the wrapper with no params' 


  it 'should not match a wrapper that raises an error' 


  [ [true], [false], [''], ['string'], [nil], [0], [1.1], [[]], ['one', 'two'], [{}], [{ 'key' => 'value' }], [:undef] ].each do |supplied_params|
    context "with_params(#{supplied_params.collect { |p| p.inspect }.join(', ')})" do
      before(:each) { subject.with_params(*supplied_params) }

      it 'should call the wrapper with the supplied params' 


      it 'should not match a wrapper that raises an error' 

    end

    [ true, false, '', 'string', nil, 0, 1.1, [], {}, :undef ].each do |expected_return|
      context "and_return(#{expected_return.inspect})" do
        before(:each) { subject.and_return(expected_return) }

        it 'should match a wrapper that does return the requested value' 


        it 'should not match a wrapper that does return a different value' 

      end

      context "and_raise_error(ArgumentError)" do
        before(:each) { subject.and_raise_error(ArgumentError) }

        it 'should match a wrapper that raises ArgumentError' 


        [ true, false, '', 'string', nil, 0, 1.1, [], {}, :undef ].each do |value|
          it "should not match a wrapper that returns #{value.inspect}" 

        end

        it 'should not match a wrapper that raises a different error' 

      end

      context "and_raise_error(ArgumentError, /message/)" do
        before(:each) { subject.and_raise_error(ArgumentError, /message/) }

        it 'should match a wrapper that raises ArgumentError("with matching message")' 


        it 'should not match a wrapper that raises a different ArgumentError' 


        [ true, false, '', 'string', nil, 0, 1.1, [], {}, :undef ].each do |value|
          it "should not match a wrapper that returns #{value.inspect}" 

        end

        it 'should not match a wrapper that raises a different error' 

      end
    end
  end
end

