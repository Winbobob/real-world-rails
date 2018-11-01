# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::CalculatedAdjustments do
  let(:calculator_class) { Spree::Calculator::FlatRate }

  with_model :Calculable, scope: :all do
    model do
      include Spree::CalculatedAdjustments
    end
  end

  it "should add has_one :calculator relationship" 


  describe 'initialization' do
    context 'with no calculator' do
      subject { Calculable.new }

      it 'can be initialized' 


      it 'is not valid' 

    end

    context 'with calculator object' do
      subject { Calculable.new(calculator: calculator_class.new) }

      it 'can be initialized' 


      it 'can be created' 

    end

    context 'with calculator_type' do
      subject { Calculable.new(calculator_type: calculator_class.to_s) }

      it 'can be initialized' 


      it 'can be created' 

    end

    context 'with calculator_type and calculator_attributes' do
      subject { Calculable.new(calculator_type: calculator_class.to_s, calculator_attributes: { preferred_amount: 123 }) }

      it 'can be initialized' 


      it 'can be created' 

    end
  end

  describe 'update' do
    subject { Calculable.create!(calculator_type: calculator_class.to_s) }

    it "can update calculator attributes with id" 


    it "can update calculator attributes without id" 


    it "can update both calculator type and attributes" 

  end

  describe '#calculator_type=' do
    subject { Calculable.new }

    let(:calculator_subclass) { Spree::Calculator::Shipping::FlatRate }
    let(:calculator_superclass) { Spree::ShippingCalculator }

    before(:each) do
      subject.calculator_type = calculator_subclass.to_s
    end

    it 'sets calculator type' 


    it 'switches from calculator subclass to calculator superclass' 

  end
end

