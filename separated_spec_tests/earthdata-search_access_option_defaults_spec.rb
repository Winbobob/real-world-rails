require "spec_helper"

# Reset because this spec is heavily dependent on the database, which gets
# cleared between runs
describe "Access Option Defaults", reset: true do
  collection_id = 'C203234523-LAADS'
  collection_title = 'MODIS/Aqua Calibrated Radiances 5-Min L1B Swath 1km V006'

  page_options = {project: [collection_id], temporal: ['2016-01-21T00:00:00Z', '2016-01-21T00:00:01Z']}

  let(:echo_id) { "4C0390AF-BEE1-32C0-4606-66CAFDD4131D" }

  before :each do
    load_page :search, overlay: false
    login
  end

  after :each do
    wait_for_xhr
    AccessConfiguration.destroy_all if page.server.responsive?
  end

  context "accessing a collection with preferences for a method that no longer exists" do
    before :each do
      user = User.find_or_create_by(echo_id: echo_id)
      options = {
        'accessMethod' => [{'method' => 'stale', 'model' => '<broken/>', 'rawModel' => '<broken/>', 'type' => 'order'}]
      }
      AccessConfiguration.set_default_access_config(user, collection_id, options, nil)
      load_page 'data/configure', page_options
    end

    it "presents default options" 

  end

  context "accessing a collection with order preferences that are no longer valid" do
    before :each do
      user = User.find_or_create_by(echo_id: echo_id)
      options = {
        'accessMethod' => [{'method' => 'stale', 'model' => '<broken/>', 'rawModel' => '<broken/>', 'type' => 'order'}]
      }
      AccessConfiguration.set_default_access_config(user, collection_id, options, [{'id' => 'test', 'form_hash' => 'stale'}])
      load_page 'data/configure', page_options
    end

    it "presents default options for the order" 

  end

  context "accessing a collection with order preferences that are changed" do
    before :each do
      user = User.find_or_create_by(echo_id: echo_id)
      options = {
          'accessMethod' => [{'method' => 'stale', 'model' => '<broken/>', 'rawModel' => '<broken/>', 'type' => 'order'}]
      }
      AccessConfiguration.set_default_access_config(user, collection_id, options, [{'id' => '7E65A0BF-6A43-1891-1A2E-D6D8CBF01768', 'form_hash' => 'original_hash'}])
      load_page 'data/configure', page_options
    end

    it "presents default options for the order" 

  end

  context "accessing a collection for the first time" do
    before :each do
      load_page 'data/configure', page_options
      wait_for_xhr
    end

    it "presents default options" 

  end

  context "accessing a collection for a second time" do
    before :each do
      load_page 'data/configure', page_options
      wait_for_xhr

      choose 'Direct Download'
      click_on 'Add access method'

      within '.access-item-selection:nth-child(4)' do
        choose 'Stage for Delivery'
      end

      select 'FtpPull', from: 'Distribution Options'

      click_on 'Continue'
      click_on 'Submit'
      wait_for_xhr
      expect(page).to have_content('When the data for the following orders becomes available')
      expect(page).to have_content(collection_title)

      load_page 'data/configure', page_options
      wait_for_xhr
    end

    it "restores options from the first retrieval" 


    context "with corrupted data in the database" do
      before :all do
        latest = AccessConfiguration.last
        # Insert an invalid piece of data here which used to trigger an error.
        AccessConfiguration.connection.execute("INSERT INTO access_configurations (id, user_id, dataset_id, echoform_digest) VALUES (#{latest.nil? ? 1 : latest.id + 1}, 1, 'C203234523-LAADS', '\"[{\"id\":\"download\"}]\"')")
        load_page 'data/configure', page_options
        wait_for_xhr
      end

      it "doesn't display an error and loads the default configuration" 

    end
  end

  context "accessing a collection for the third time" do
    before :each do
      load_page 'data/configure', page_options
      wait_for_xhr

      choose 'Direct Download'
      click_on 'Add access method'

      within '.access-item-selection:nth-child(4)' do
        choose 'Stage for Delivery'
      end

      select 'FtpPull', from: 'Distribution Options'

      click_on 'Continue'
      click_on 'Submit'
      expect(page).to have_content('When the data for the following orders becomes available')

      load_page 'data/configure', page_options
      wait_for_xhr

      within '.access-item-selection:nth-child(4)' do
        click_on 'Remove access method'
      end

      click_on 'Submit'
      wait_for_xhr
      expect(page).to have_link('View/Download Data Links')
      expect(page).to have_no_content('When the data for the following orders becomes available')

      load_page 'data/configure', page_options
      wait_for_xhr
    end

    it "restores options from the second retrieval" 

  end

end

