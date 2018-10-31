require 'rails_helper'

RSpec.describe RefreshConstituencyPartyJob, type: :job do
  def stub_members_api
    stub_request(:get, "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/House=Commons%7CIsEligible=true/")
  end

  def xml_response(body = "<Members />")
    {status: 200, headers: {"Content-Type" => "application/xml"}, body: body}
  end

  def xml_error(status = 404, body = "<Members />")
    {status: status, headers: {"Content-Type" => "application/xml"}, body: body}
  end

  let!(:constituency) { FactoryBot.create(:constituency, :coventry_north_east) }

  context "when the API returns a 200 OK response" do
    before do
      expect(Constituency).to receive(:find_each).and_yield(constituency)
    end

    context "and the MP is active" do
      before do
        stub_members_api.to_return xml_response <<-XML
          <Members>
            <Member Member_Id="4378" Dods_Id="109467" Pims_Id="6062">
              <DisplayAs>Colleen Fletcher</DisplayAs>
              <ListAs>Fletcher, Colleen</ListAs>
              <FullTitle>Colleen Fletcher MP</FullTitle>
              <LayingMinisterName/>
              <DateOfBirth>1954-11-23T00:00:00</DateOfBirth>
              <DateOfDeath xsi:nil="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
              <Gender>F</Gender>
              <Party Id="15">Labour</Party>
              <House>Commons</House>
              <MemberFrom>Coventry North East</MemberFrom>
              <HouseStartDate>2015-05-07T00:00:00</HouseStartDate>
              <HouseEndDate xsi:nil="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
              <CurrentStatus Id="0" IsActive="True">
                <Name>Current Member</Name>
                <Reason/>
                <StartDate>2017-06-08T00:00:00</StartDate>
              </CurrentStatus>
            </Member>
          </Members>
        XML
      end

      it "updates the constituency with the party" 

    end

    context "and the MP is not active" do
      before do
        stub_members_api.to_return xml_response <<-XML
          <Members />
        XML
      end

      it "clears the constituency mp id" 


      it "clears the constituency mp name" 


      it "clears the constituency mp date" 

    end
  end

  context "when the API returns a HTTP error" do
    before do
      stub_members_api.to_return(xml_error)
    end

    it "captures the error" 


    it "notifies Appsignal" 

  end

  context "when the API times out" do
    before do
      stub_members_api.to_timeout
    end

    it "captures the error" 


    it "notifies Appsignal" 

  end
end

