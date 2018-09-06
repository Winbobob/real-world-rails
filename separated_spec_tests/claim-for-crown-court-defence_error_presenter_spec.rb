require 'rails_helper'

describe ErrorPresenter do

  let(:claim)           { FactoryBot.build :claim }

  let(:filename)        { File.dirname(__FILE__) + '/data/error_messages.en.yml' }
  let(:presenter)       { ErrorPresenter.new(claim, filename) }


  describe 'generate_sequence' do
    context 'base class level fieldnames' do
      context 'fieldname present' do
        it 'should return the value from the error messages file' 

      end

      context 'fieldname not present' do
        it 'should return 99999 ' 

      end
    end
  end

  context 'one error message per attribute' do
    context 'header_errors' do
      context 'fieldname present in translations file' do

        context 'error string present in translations file' do
          it 'should use the long form of the translation' 

        end

        context 'error string not present in translations file' do
          it 'should generate an error message from the field name and the error' 

        end
      end

      context 'fieldname not present in translations file' do
        it 'should generate an error message from the field name and the error' 

      end
    end

    context '#field_level_error_for' do
      context 'fieldname present in translations file' do

        context 'error string present in translations file' do
          it 'should return the short message' 

        end

        context 'error string not present in translations file' do
          it 'should return the error message without the fieldame' 

        end
      end

      context 'fieldname not present in translation file' do
        it 'should return the error message without the fieldname' 

      end
    end
  end

  context 'multiple error messages per attribute' do
    context 'header messages' do
      context 'fieldname present in translation file' do
        it 'should use the long forms of the translation' 
      it 'should replace the numbered submodel in the title' 

    end
  end
end

