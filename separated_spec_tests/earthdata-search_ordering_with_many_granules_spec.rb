require 'spec_helper'
require 'rake'

describe 'Access data with more than 2000 granules', reset: false do
  collection_id = 'C1000000561-NSIDC_ECS'
  aster_collection_id = 'C14758250-LPDAAC_ECS'

  before :all do
    Delayed::Worker.delay_jobs = true
    Capybara.reset_sessions!
    load_page :search, overlay: false
    login
  end

  after :all do
    Delayed::Worker.delay_jobs = false
    Capybara.reset_sessions!
  end

  context "from one collection" do
    context "with more than 2000 granules" do
      before :all do
        load_page 'data/configure', project: [collection_id]
        wait_for_xhr
      end

      context "and selecting 'ESI service' option" do
        before :all do
          choose 'Customize Product'
          wait_for_xhr
          fill_in 'Email Address', with: "patrick+edsc@element84.com\t"
          click_on 'Continue'
        end

        after :all do
          load_page 'data/configure', project: [collection_id]
        end

        it "shows a modal dialog" 

      end

      context "and selecting 'Order' option" do
        before :all do
          choose 'Stage for Delivery'
          click_on 'Continue'
        end

        after :all do
          load_page 'data/configure', project: [collection_id]
        end

        it 'displays a warning about multiple emails' 


        context 'when accepting the modal', pending_updates: true do
          before :all do
            # sleep 1
            within '.modal-footer' do
              click_link 'Continue'
            end
            click_on 'Submit'
            wait_for_xhr

          end

          it 'initially shows the order in the "Creating" state' 


          context 'after the order processes' do
            before :each do
              Delayed::Worker.new(quiet: false).work_off
            end

            it 'shows the order in the "Closed" state' 

          end
        end
      end
    end
  end

  context "from multiple (two) collections" do
    before :all do
      load_page 'data/configure', {project: ['C179002914-ORNL_DAAC', collection_id]}
      wait_for_xhr
    end

    context "with the first collection having no more than 2000 granules in the order" do
      before :all do
        choose 'Stage for Delivery'
        click_on 'Continue'
      end

      it "doesn't show a modal dialog" 


      context "and the second collection having more than 2000 granules" do
        before :all do
          choose 'Stage for Delivery'
          click_on 'Continue'
        end

        it "shows a modal dialog" 

      end
    end
  end
end

