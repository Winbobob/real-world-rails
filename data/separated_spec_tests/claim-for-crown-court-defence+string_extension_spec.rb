require 'rails_helper'

describe String do

  context '#zero?' do
    context 'for blank values' do
      it 'should be false' 

    end

    context 'for numeric non-zero values' do
      %w(1 0.1 0.01 1.0).each do |value|
        it "should be false for #{value}" 

      end
    end

    context 'for numeric zero values' do
      %w(0 0.0 0.00 000).each do |value|
        it "should be true for #{value}" 

      end
    end
  end

  context 'to_bool' do
    context 'for blank values' do
      it 'should be false for empty string' 


      it 'should be false for only spaces string' 

    end

    context 'for truthy values' do
      %w(true t yes y 1).each do |value|
        it "should be true for '#{value}'" 

      end
    end

    context 'for falsey values' do
      %W(false f no n 0).each do |value|
        it "should be false for '#{value}'" 

      end
    end
  end

  context 'alpha?' do
    context 'for blank values' do
      it 'should be false for empty string' 


      it 'should be false for only spaces string' 

    end

    context 'truthy values' do
      %w(abc ABC).each do |value|
        it "should be true for '#{value}'" 

      end
    end

    context 'falsey values' do
      %w(123 a1b z1 0).each do |value|
        it "should be false for '#{value}'" 

      end
    end
  end

  context 'digit?' do
    context 'for blank values' do
      it 'should be false for empty string' 


      it 'should be false for only spaces string' 

    end

    context 'truthy values' do
      %w(0 1 123).each do |value|
        it "should be true for '#{value}'" 

      end
    end

    context 'falsey values' do
      %w(a a1b z1 1z 1.5).each do |value|
        it "should be false for '#{value}'" 

      end
    end
  end
end

