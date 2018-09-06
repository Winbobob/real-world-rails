require 'spec_helper'

feature 'Remove irrelevant information in court information page' do
  let!(:all_areas_of_law) do
    ["Adoption", "Bankruptcy", "Children", "Civil partnership",
     "Crime", "Divorce", "Domestic violence", "Employment", "Forced marriage",
     "High court", "Housing possession", "Immigration", "Money claims",
     "Probate", "Social security"].each { |name| create(:area_of_law, name: name) }
  end

  let!(:liverpool_court) do
    VCR.use_cassette('postcode_found') do
      create(:court,
        name: 'Liverpool Civil and Family Court',
        areas_of_law: [AreaOfLaw.find_by(name: 'Money claims'),
                       AreaOfLaw.find_by(name: 'Housing possession')],
        info: 'More information',
        court_facilities: [create(:court_facility,
          facility: create(:facility))],
        addresses: [create(:address,
          address_line_1: '102 Mars Street',
          town: create(:town),
          address_type: create(:address_type),
          postcode: 'SW1H 9AJ')],
        latitude: 51.82175899400838,
        longitude: -3.02319556862789)
    end
  end

  let!(:create_external_link) { create(:external_link, text: 'GOV.UK', url: 'https://www.gov.uk') }

  it 'should not have related links, location of building, leaflets and further information' 


  it 'should have building facilities, disabled access and areas of law' 


  context 'areas of law' do
    it 'should display only relevant areas of law to the court' 

  end
end

