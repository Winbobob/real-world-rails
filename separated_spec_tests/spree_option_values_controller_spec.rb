require 'spec_helper'

module Spree
  describe Api::V1::OptionValuesController, type: :controller do
    render_views

    let(:attributes) { [:id, :name, :presentation, :option_type_name, :option_type_id, :option_type_presentation] }
    let!(:option_value) { create(:option_value) }
    let!(:option_type) { option_value.option_type }

    before do
      stub_authentication!
    end

    def check_option_values(option_values)
      expect(option_values.count).to eq(1)
      expect(option_values.first).to have_attributes([:id, :name, :presentation,
                                                      :option_type_name, :option_type_id])
    end

    context 'without any option type scoping' do
      before do
        # Create another option value with a brand new option type
        create(:option_value, option_type: create(:option_type))
      end

      it 'can retrieve a list of all option values' 

    end

    context 'for a particular option type' do
      let(:resource_scoping) { { option_type_id: option_type.id } }

      it 'can list all option values' 


      it 'can search for an option type' 


      it 'can retrieve a list of option types' 


      it 'can list a single option value' 


      it 'cannot create a new option value' 


      it 'cannot alter an option value' 


      it 'cannot delete an option value' 


      context 'as an admin' do
        sign_in_as_admin!

        it 'can learn how to create a new option value' 


        it 'can create an option value' 


        it 'cannot create an option type with invalid attributes' 


        it 'can update an option value' 


        it 'permits the correct attributes' 


        it 'cannot update an option value with invalid attributes' 


        it 'can delete an option value' 

      end
    end
  end
end

