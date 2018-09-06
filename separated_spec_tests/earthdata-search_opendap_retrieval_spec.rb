require 'spec_helper'

describe 'OPeNDAP Retrieval', reset: false do
  before(:all) do
    load_page :search, overlay: false
    login
  end

  after(:all) do
    wait_for_xhr
    AccessConfiguration.destroy_all if page.server.responsive?
  end

  opendap_collection = 'C191855458-LARC'
  grid_opendap_collection = 'C7085910-LARC_ASDC'
  non_opendap_collection = 'C179003030-ORNL_DAAC'

  # TODO: RDA // After discussing with Patrick Quinn, there are
  # no more autodiscovered opendap collections. This is likely a bug
  # and should be discussed further
  autodiscovered_opendap_collection = 'C2930962-PODAAC'

  context 'configuring a non-OPeNDAP collection and selecting the "Download" option' do
    before(:all) do
      load_page 'data/configure', project: [non_opendap_collection]
      choose 'Direct Download'
    end

    it "displays no subsetting options" 


    it "displays no file format conversion options" 

  end

  # context 'configuring an auto-discovered OPeNDAP collection and selecting the "Download" option' do
  #   before(:all) do
  #     load_page('data/configure',
  #               project: [autodiscovered_opendap_collection],
  #               bounding_box: [0, 0, 2, 2])
  #     choose 'Direct Download'
  #   end

  #   it "displays a choice of file formats" do
  #     expect(page).to have_text('File format')
  #   end

  #   it "chooses the original format by default" do
  #     expect(page).to have_checked_field('Original (No Subsetting)')
  #   end

  #   context 'choosing the ASCII file format' do
  #     before(:all) do
  #       choose 'ASCII'
  #     end

  #     it 'shows spatial subsetting options' do
  #       expect(page).to have_text('Spatial subsetting')
  #     end

  #     it 'defaults spatial subsetting options to being checked' do
  #       expect(page).to have_checked_field("Subset to my spatial search area's bounding box")
  #     end

  #     it 'shows a map displaying the spatial subsetting area' do
  #       expect(page).to have_css('.access-subset-map > .access-mbr[style="top: 86px; left: 178px; height: 6px; width: 6px;"]')
  #     end

  #     it 'shows parameter subsetting options' do
  #       expect(page).to have_text('Parameters')
  #     end

  #     it 'defaults parameter subsetting options to being checked' do
  #       expect(page).to have_checked_field('time_bnds')
  #       expect(page).to have_checked_field('time_bnds')
  #     end
  #   end

  #   context 'choosing the original file format' do
  #     before(:all) do
  #       choose 'Original (No Subsetting)'
  #     end

  #     it 'hides spatial subsetting' do
  #       expect(page).to have_no_text('Spatial subsetting')
  #       expect(page).to have_no_field("Subset to my spatial search area's bounding box")
  #     end

  #     it 'hides parameter subsetting' do
  #       expect(page).to have_no_text('Parameters')
  #       expect(page).to have_no_field('time_bnds')
  #     end
  #   end
  # end

  context 'configuring a manually-configured OPeNDAP collection and selecting the "Download" option' do
    before(:all) do
      load_page('data/configure',
                project: [opendap_collection],
                bounding_box: [0, 0, 2, 2],
                temporal: ['2014-07-23T00:00:00Z', '2014-08-02T00:00:00Z'])
      choose 'Direct Download'
    end

    it "displays a choice of file formats" 


    it "chooses the original format by default" 


    context 'choosing the ASCII file format' do
      before(:all) do
        choose 'ASCII'
      end

      it 'shows spatial subsetting options' 


      it 'defaults spatial subsetting options to being checked' 


      it 'shows a map displaying the spatial subsetting area' 


      it 'shows parameter subsetting options' 


      it 'defaults parameter subsetting options to being checked' 

    end

    context 'choosing the original file format' do
      before(:all) do
        choose 'Original (No Subsetting)'
      end

      it 'hides spatial subsetting' 


      it 'hides parameter subsetting' 

    end
  end

  context 'configuring an OPeNDAP collection which uses <Grid> elements' do
    before(:all) do
      load_page('data/configure', project: [grid_opendap_collection])
    end

    it "presents parameters exposed by <Grid> elements" 

  end

  # context 'downloading an auto-discovered OPeNDAP collection with subsetting options' do
  #   before(:all) do
  #     load_page('data/configure',
  #               project: [autodiscovered_opendap_collection],
  #               bounding_box: [0, 0, 2, 2])
  #     choose 'Direct Download'
  #     choose 'ASCII'
  #     uncheck 'lon_bnds'
  #     click_on 'Submit'
  #     click_link "View Download Links"
  #   end

  #   after(:all) do
  #     Capybara.reset_sessions!
  #     load_page :search, overlay: false
  #     login
  #   end

  #   it 'provides a URL describing metadata about the collection\'s parameters' do
  #     within_window('Earthdata Search - Download Granule Links') do
  #       expect(page).to have_css('a[href*=".nc.info"]')
  #     end
  #   end

  #   it 'provides links the data in the selected file format' do
  #     within_window('Earthdata Search - Download Granule Links') do
  #       expect(page).to have_css('a[href*=".nc.ascii?"]')
  #       expect(page).to have_css('a[href*="http://podaac-opendap.jpl.nasa.gov/opendap/allData/amsre/L3/sst_1deg_1mo"]')
  #     end
  #   end

  #   it 'subsets the data to the selected parameters' do
  #     within_window('Earthdata Search - Download Granule Links') do
  #       expect(page).to have_css('a[href*="lat_bnds"]')
  #       expect(page).to have_css('a[href*="time_bnds"]')
  #       expect(page).to have_css('a[href*="tos"]')
  #       expect(page).to have_no_css('a[href*="lon_bnds"]')
  #     end
  #   end

  #   it 'applies spatial subsetting' do
  #     within_window('Earthdata Search - Download Granule Links') do
  #       expect(page).to have_css('a[href*="tos[0:102][90:92][180:182]"]')
  #     end
  #   end
  # end

  context 'downloading a manually-configured OPeNDAP collection with subsetting options' do
    before(:all) do
      load_page('data/configure',
                project: [opendap_collection],
                bounding_box: [0, 0, 2, 2],
                temporal: ['2014-07-23T00:00:00Z', '2014-08-02T00:00:00Z'])
      choose 'Direct Download'
      choose 'ASCII'
      uncheck 'APrioriCOMixingRatioProfileDay'
      click_on 'Submit'
      click_link "View/Download Data Links"
    end

    after(:all) do
      Capybara.reset_sessions!
      load_page :search, overlay: false
      login
    end

    it 'provides a URL describing metadata about the collection\'s parameters' 


    it 'provides links the data in the selected file format' 


    it 'subsets the data to the selected parameters' 


    it 'applies spatial subsetting' 

  end

  # context 'downloading an OPeNDAP collection in its original format' do
  #   before(:all) do
  #     load_page('data/configure',
  #               project: [autodiscovered_opendap_collection],
  #               bounding_box: [0, 0, 2, 2])
  #     choose 'Direct Download'
  #     choose 'Original (No Subsetting)'
  #     click_on 'Submit'
  #     wait_for_xhr
  #     click_link "View Download Links"
  #   end

  #   after(:all) do
  #     Capybara.reset_sessions!
  #     load_page :search, overlay: false
  #     login
  #   end

  #   it 'does not provide a URL describing the collection\'s parameters' do
  #     within_last_window do
  #       fetch_download_links
  #       expect(page).to have_no_css('a[href*=".info"]')
  #     end
  #   end

  #   it 'provides links to the original data without opendap parameters' do
  #     within_last_window do
  #       fetch_download_links
  #       expect(page).to have_css('a[href="http://podaac-opendap.jpl.nasa.gov/opendap/allData/amsre/L3/sst_1deg_1mo/tos_AMSRE_L3_v7_200206-201012.nc"]')
  #     end
  #   end
  # end
end

