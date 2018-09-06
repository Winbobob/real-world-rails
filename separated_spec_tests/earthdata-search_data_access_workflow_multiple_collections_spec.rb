require 'spec_helper'

describe 'Data Access workflow', reset: false do
  test_collection_1 = 'C203234523-LAADS'
  test_collection_2 = 'C194001241-LPDAAC_ECS'
  test_collection_3 = 'C1000000561-NSIDC_ECS'

  context 'When a user has three collections within a project' do
    before(:all) do
      Capybara.reset_sessions!
      load_page :search, project: [test_collection_1, test_collection_2, test_collection_3], view: :project
      login

      click_button 'Download project data'
      wait_for_xhr

      # Ensure that an access method is selected before continuing
      within '.data-access-content .access-item:nth-child(1)' do
        page.find('.access-item-selection .input-tab:nth-of-type(1)').click
      end
    end

    it 'displays 3 configuration panels' 


    it 'opens the first panel' 


    it 'collapses the second panel' 


    it 'collapses the third panel' 


    it 'displays no "Back" button' 


    it 'displays a "Continue" button' 


    context 'when continuing to the second collection' do
      before(:all) do
        click_button 'Continue'

        # Ensure that an access method is selected before continuing
        within '.data-access-content .access-item:nth-child(2)' do
          page.find('.access-item-selection .input-tab:nth-of-type(1)').click
        end
      end

      it 'collapses the first panel' 


      it 'opens the second panel' 


      it 'collapses the third panel' 


      it 'displays a "Back" button' 


      it 'displays a "Continue" button' 


      context 'when continuing to the third collection' do
        before(:all) do
          click_button 'Continue'

          # Ensure that an access method is selected before continuing
          within '.data-access-content .access-item:nth-child(3)' do
            page.find('.access-item-selection .input-tab:nth-of-type(1)').click
          end
        end

        it 'collapses the first panel' 


        it 'collapses the second panel' 


        it 'opens the third panel' 


        it 'displays a submit button to submit the order' 

      end
    end
  end
end

