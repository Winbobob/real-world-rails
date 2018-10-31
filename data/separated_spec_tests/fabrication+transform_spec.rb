require 'spec_helper'

describe Fabrication::Transform do

  before do
    Fabrication.clear_definitions
    Fabrication::Transform.clear_all
  end

  describe '.apply_to' do
    context 'find definitions' do
      context 'transforms are empty' do
        it 'loads the definitions' 

      end

      context 'transforms are not empty' do
        it 'does not load the definitions' 

      end
    end

    context 'when there is a generic transform for that column' do
      before do
        Fabrication::Transform.define(:city, lambda {|value| value.split.first})
      end

      context 'fabricating an instance that is described by the per fabricator transform' do
        before do
          Fabrication::Transform.only_for(:address, :city, lambda {|value| value.upcase})
        end

        it 'applies the transform to the specified types' 

      end

      context 'no override has been defined' do
        it 'applies the generic transform' 

      end
    end

    context 'when no generic transform has been defined' do
      it 'does not change value' 

    end

    context 'ensuring precedence' do
      context 'override is done before generic transform' do
        before do
          Fabrication::Transform.only_for(:address, :city, lambda {|value| value.upcase})
          Fabrication::Transform.define(:city, lambda {|value| value.split.first})
        end

        it 'applies corretly' 

      end
    end
  end

  describe '.clear_all' do
    it 'clears all transforms' 

  end

  describe '.define' do
    it 'registers transform' 

  end

  describe '.only_for' do
    it 'registers an override transform for provided model' 

  end

end

