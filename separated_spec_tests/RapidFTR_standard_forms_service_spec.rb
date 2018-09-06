require 'spec_helper'

describe StandardFormsService do
  describe '#persist' do
    before :each do
      reset_couchdb!
    end

    describe 'saving forms' do
      it 'should persist enquiry form' 


      it 'should persist child form' 


      it 'should save both forms 'do
        attributes = {'forms' => {
          'children' => {'user_selected' => '1', 'id' => 'children'},
          'enquiries' => {'user_selected' => '1', 'id' => 'enquiries'}}}
        StandardFormsService.persist(attributes)
        expect(Form.all.all.length).to eq 2
        expect(Form.all.map(&:name)).to include(Child::FORM_NAME, Enquiry::FORM_NAME)
      end

      it 'should not add already existing forms' 

    end

    describe 'saving form sections' do
      it 'should persist new form with new form sections' 


      it 'should persist new enquiry form with new enquiry criteria form sections' 


      it 'should persist new form sections on existing forms with no form sections' 


      it 'should persist new form sections on existing forms with form sections' 


      it 'should persist new form sections on existing forms with existing form sections that have the same name' 

    end

    describe 'saving fields' do
      it 'should persist new form with new form sections with all fields' 


      it 'should persist existing form with new form sections with all fields' 

    end
  end
end

