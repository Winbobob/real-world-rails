require 'rails_helper'

describe API::ErrorResponse do

    VALID_MODEL_KLASSES = [::Fee, ::Expense, ::Disbursement, ::Claim, ::Defendant, ::DateAttended, ::RepresentationOrder]
    EXCEPTION_KLASSES = [RuntimeError, ArgumentError]

    let(:claim) { FactoryBot.build :claim, case_number: 'A123456' }
    let(:er) { described_class.new(claim)}

    before(:each) do
      claim.force_validation = true
      claim.valid?
    end

    context 'accepts specific model objects' do
      VALID_MODEL_KLASSES.each do |model_klass|
        let(:model_instance) { FactoryBot.build(model_klass.name.underscore.to_sym) }
        it "accepts #{model_klass.name}" 

      end
    end

    context 'accepts exception objects' do

      EXCEPTION_KLASSES.each do |exception_klass|
        let(:ex) { exception_klass.new('my exception message') }
        
        it "does not raise a runtime error for #{exception_klass}" 


        it 'populates status with 400 and body with a JSON error format message' 

      end

      it 'populates status with 401 if exception message is "Unauthorized"' 

    end

    context 'accepts other objects without breaking' do
      [1,"1",[1,2]].each do |other_object|
        it "accepts #{other_object.class.name} without raising an error" 


        it 'populates statuswith 400 and body with general error message' 

      end
    end

    it 'returns status and body' 


    it 'returned body is in JSON format' 


    it 'raises an error if model is valid' do  #pending because claim.errors contains an empty array for external_users
      claim.update_attribute(:case_number, 'A20161234')
      expect(claim).to be_valid
      expect{ described_class.new(claim) }.to raise_error("unable to build error response as no errors were found")
    end

end

