require 'rails_helper'

RSpec.describe AdditionalInformationForm, type: :form do
  let(:additionl_information_form) { described_class.new(resource) }

  let(:resource) { Claim.new }

  describe 'validations' do
    describe 'on #miscellaneous information' do
      context 'when has_miscellaneous_information is true' do
        before { additionl_information_form.has_miscellaneous_information = 'true' }
        it     { expect(additionl_information_form).to ensure_length_of(:miscellaneous_information).is_at_most(2500) }
      end
    end

    describe 'on #miscellaneous_information' do
      before do
        additionl_information_form.miscellaneous_information = 'such miscellany'
      end

      context 'when #has_miscellaneous_information? is true' do
        before { additionl_information_form.has_miscellaneous_information = 'true' }

        it 'saves #miscellaneous_information to the underlying resource' 

      end

      context 'when #has_miscellaneous_information? is false' do
        before { additionl_information_form.has_miscellaneous_information = 'false' }

        it 'sets #miscellaneous_information to nil on the underlying resource' 

      end
    end
  end

  describe '#has_miscellaneous_information?' do
    context 'when the underlying resource' do
      context 'does have miscellaneous information' do
        before do
          resource.miscellaneous_information = 'such miscellany'
        end

        it 'returns true' 


        it 'sets self.has_miscellaneous_information= with true' 

      end

      context 'does not have miscellaneous information' do
        before do
          resource.miscellaneous_information = ''
        end

        it 'returns false' 


        it 'sets self.has_miscellaneous_information= with false' 

      end
    end
  end
end

