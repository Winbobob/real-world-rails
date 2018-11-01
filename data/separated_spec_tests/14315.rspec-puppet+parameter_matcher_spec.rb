require 'spec_helper'

describe RSpec::Puppet::ManifestMatchers::ParameterMatcher do
  describe '#matches?' do
    context 'with [1] expected' do
      subject do
        described_class.new(:foo_parameter, [1], :should)
      end

      it 'matches [1]' 

      it 'does not match []' 

      it 'does not match [1,2,3]' 

      it 'does not match nil' 

    end
    context 'with [1,2,3] expected' do
      subject do
        described_class.new(:foo_parameter, [1,2,3], :should)
      end

      it 'matches [1,2,3]' 

      it 'does not match []' 

      it 'does not match nil' 

    end
    context 'with {"foo" => "bar"} expected' do
      subject do
        described_class.new(:foo_parameter, {"foo" => "bar"}, :should)
      end

      it 'matches {"foo" => "bar"}' 

      it 'does not match nil' 

      it 'does not match {}' 

      it 'does not match {"foo" => "baz"}' 

    end

    context 'with lambda(){"foo"} expected' do
      subject do
        block = lambda {|actual| actual == "foo" }
        described_class.new(:foo_parameter, block, :should)
      end

      it 'matches "foo"' 

      it 'does not match nil' 

    end

    context 'with /foo/ expected' do
      subject do
        described_class.new(:foo_parameter, /foo/, :should)
      end

      it 'matches "foo"' 

      it 'does not match nil' 

    end

    context 'with "foo" expected' do
      subject do
        described_class.new(:foo_parameter, "foo", :should)
      end

      it 'matches "foo"' 

      it 'does not match nil' 

    end
  end
end

