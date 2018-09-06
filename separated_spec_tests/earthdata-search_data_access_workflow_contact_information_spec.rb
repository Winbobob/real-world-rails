require 'spec_helper'

describe 'Data Access workflow', reset: false do
  context 'When choosing a collection that supports State for Delivery' do
    before :all do
      load_page :search, project: ['C1358859924-ORNL_DAAC'], view: :project
      login

      click_button 'Download project data'
      wait_for_xhr
    end

    it 'displays 1 configuration panel' 


    context 'When selecting the State for Delivery Access method' do
      before(:all) do
        choose 'Stage for Delivery'
        click_button 'Continue'
      end

      it 'adds an addition configuration panel for contact information' 


      it 'displays the contact information panel' 


      it 'displays current contact information' 


      it 'includes a button to edit your profile' 


      it 'displays a submit button to submit the order' 

    end
  end
end

