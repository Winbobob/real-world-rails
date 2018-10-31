require 'rails_helper'

describe AdpFormBuilder do

  let(:resource)  { FactoryBot.create :claim }
  let(:builder)   { AdpFormBuilder.new(:claim, resource, self, {} ) }

  describe 'anchored_label' do
    context 'no anchor name supplied' do
      it 'should take the label as the anchor name' 

    end

    context 'anchor name supplied' do
      it 'should use anchor name supplied' 

    end

    context 'extra html attributes supplied' do
      it 'should use the attributes when anchor name supplied' 


      it 'should use the attributes when no anchor name provided' 

    end
  end

  describe 'anchored_without_label' do
    context 'no anchor name supplied' do
      it 'should take the label as the anchor name' 

    end

    context 'anchor name supplied' do
      it 'should use anchor name supplied' 

    end

    context 'extra html attributes supplied' do
      it 'should use the attributes' 

    end
  end

  describe 'anchored_attribute' do
    it 'should build the label from the object and label' 


    it 'should use any provided attributes' 

  end
end


def squash(html)
  html.gsub(/\s+\</, '<').chomp
end

