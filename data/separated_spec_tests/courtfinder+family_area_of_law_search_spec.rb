shared_examples "a search with area of law" do |area_of_law_name|

  let!(:children) { create(:area_of_law, name: 'Children', type_children: true) }
  let!(:divorce) { create(:area_of_law, name: 'Divorce', type_divorce: true) }
  let!(:adoption) { create(:area_of_law, name: 'Adoption', type_adoption: true) }
  let!(:at_visiting) { create(:address_type, name: "Visiting") }
  let!(:town) { create(:town, name: "London") }
  let!(:visiting_address) do
    create(:address, address_line_1: "Some street",
                     address_type_id: at_visiting.id, postcode: 'SE19NH', town_id: town.id)
  end

  context "Chosen area of law is #{area_of_law_name}" do
    include CourtLocalAuthorityHelper

    let!(:area) { AreaOfLaw.find_by(name: area_of_law_name) }
    # Location: http://mapit.service.dsd.io/nearest/4326/-0.110768,51449126: SW2 2YH (Inside the Lambeth Borough Council)
    let!(:court7) do
      VCR.use_cassette('postcode_found') do
        create(:court, court_number: 434, name: "#{area.name} Court A", display: true, areas_of_law: [area],
                       address_ids: [visiting_address.id])
      end
    end
    let!(:local_authority) { LocalAuthority.create(name: 'Lambeth Borough Council') }

    before(:each) do
      add_local_authorities_to_court local_authorities: [local_authority], court: court7, area_of_law: area
    end

    it "should return only one search result if the postcode is found in the Postcode to court mapping" 


    context 'when there are multiple courts' do
      # Location:51.451373,-0.106004 (Inside the Lambeth Borough Council)
      let(:court9) do
        VCR.use_cassette('postcode_found') do
          create(:court,
            court_number: 435,
            name: "#{area.name} Court B",
            display: true,
            areas_of_law: [area],
            address_ids: [@visiting_address3.id])
        end
      end

      before(:each) do
        add_local_authorities_to_court local_authorities: [local_authority], court: court9, area_of_law: area
      end

      it 'should return multiple courts sorted by distance' 


      context 'when one of the multiple courts does not have long/lat' do
        it 'should return multiple courts sorted by distance including a court which did not have long/lat' 

      end
    end

    context "postcode to court mapping not found" do
      let!(:court10) do
        VCR.use_cassette('postcode_found') do
          create(:court, name: 'The Nearest Court', display: true, areas_of_law: [area],
                         address_ids: [@visiting_address1.id])
        end
      end

      let!(:court11) do
        VCR.use_cassette('postcode_found') do
          create(:court, name: 'Second Nearest Court', display: true, areas_of_law: [area],
                         address_ids: [@visiting_address1.id])
        end
      end

      before(:each) do
        add_local_authorities_to_court local_authorities: [local_authority], court: court10, area_of_law: area
        add_local_authorities_to_court local_authorities: [local_authority], court: court11, area_of_law: area
      end

      it "if the postcode is not found in the Postcode to court mapping, then just default to distance search" 

    end
  end
end

