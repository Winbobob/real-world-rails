require 'spec_helper'

describe CollectionDetailsPresenterUmmJson do
  before do
    @collection = HashWithIndifferentAccess.new
    @collection[:short_name] = 'MOD02QKM'
    @collection[:version_id] = 5
    @collection[:archive_center] = 'LAADS'
  end

  # Skipped, no mapping from ECHo10 to UMM-C on this field
  xit 'converts difs' do
    dif_id = 'DIF_123'
    @collection.associated_difs = dif_id
    CollectionDetailsPresenterUmmJson.new(@collection)
    @collection.associated_difs.should eq(url: "http://gcmd.gsfc.nasa.gov/getdif.htm?#{dif_id}", id: dif_id)
  end

  it 'converts opensearch descriptive document (OSDD)' 


  it 'converts spatial points' 


  it 'converts spatial lines' 


  it 'converts spatial polygons' 


  it 'converts spatial boxes' 


  it 'converts science keywords' 


  it 'converts temporal' 


  # No longer applicable
  xit 'converts contacts' do
    data_centers = [{ 'Roles' => ['PROCESSOR'], 'ShortName' => 'AMSR-E SIPS-GHRC', 'ContactGroups' => [], 'ContactPersons' => [] }, { 'Roles' => ['ARCHIVER'], 'ShortName' => 'NSIDC', 'ContactGroups' => [], 'ContactPersons' => [] }, { 'Roles' => ['ORIGINATOR'], 'ShortName' => 'Not provided', 'ContactGroups' => [], 'ContactPersons' => [{ 'Roles' => ['Technical Contact'], 'FirstName' => 'Eni', 'LastName' => 'Njoku' }], 'ContactInformation' => { 'ContactMechanisms' => [{ 'Type' => 'Email', 'Value' => 'eni.g.njoku@jpl.nasa.gov' }], 'Addresses' => [{ 'StreetAddresses' => ['M/S 300-233, Jet Propulsion Laboratory, 4800 Oak Grove Drive'], 'City' => 'Pasadena', 'StateProvince' => 'CA', 'Country' => 'USA', 'PostalCode' => '91109' }] } }, { 'Roles' => ['ARCHIVER'], 'ShortName' => 'NASA DAAC at the National Snow and Ice Data Center', 'ContactGroups' => [], 'ContactPersons' => [], 'ContactInformation' => { 'ServiceHours' => '9=>00 A.M. to 5=>00 P.M., U.S. Mountain Time, Monday through Friday, excluding U.S. holidays.', 'ContactInstruction' => 'Contact by e-mail first', 'ContactMechanisms' => [{ 'Type' => 'Telephone', 'Value' => '303-492-6199' }, { 'Type' => 'Fax', 'Value' => '303-492-2468' }, { 'Type' => 'Email', 'Value' => 'nsidc@nsidc.org' }], 'Addresses' => [{ 'StreetAddresses' => ['1540 30th St Campus Box 449'], 'City' => 'Boulder', 'StateProvince' => 'Colorado', 'Country' => 'USA', 'PostalCode' => '80309-0449' }] } }]
    @collection['DataCenters'] = data_centers
    CollectionDetailsPresenterUmmJson.new(@collection)
    @collection[:contacts].should eq([{ 'name' => 'Eni Njoku', 'contact_mechanisms' => ['eni.g.njoku@jpl.nasa.gov'] }, { 'name' => 'NASA DAAC at the National Snow and Ice Data Center', 'contact_mechanisms' => ['303-492-6199 (Telephone)', '303-492-2468 (Fax)', 'nsidc@nsidc.org'] }])
  end

  # No longer applicable
  xit "ignores 'unknown' value for first/last name in contacts" do
    contacts = [{ 'OrganizationPhones' => { 'Phone' => [{ 'Number' => '(865) 241-3952', 'Type' => 'Direct Line' }, { 'Number' => '(865) 574-4665', 'Type' => 'Fax' }] }, 'OrganizationEmails' => { 'Email' => 'ornldaac@ornl.gov' }, 'ContactPersons' => { 'ContactPerson' => { 'FirstName' => 'unknown', 'LastName' => 'ORNL DAAC User Services' } } }]
    @collection.contacts = contacts
    CollectionDetailsPresenterUmmJson.new(@collection)
    @collection.contacts.should eq([{ name: 'ORNL DAAC User Services', phones: ['(865) 241-3952 (Direct Line)', '(865) 574-4665 (Fax)'], email: 'ornldaac@ornl.gov' }])

    contacts = [{ 'OrganizationPhones' => { 'Phone' => [{ 'Number' => '(865) 241-3952', 'Type' => 'Direct Line' }, { 'Number' => '(865) 574-4665', 'Type' => 'Fax' }] }, 'OrganizationEmails' => { 'Email' => 'ornldaac@ornl.gov' }, 'ContactPersons' => { 'ContactPerson' => { 'FirstName' => 'PLEASE CONTACT', 'LastName' => 'unknown' } } }]
    @collection.contacts = contacts
    CollectionDetailsPresenterUmmJson.new(@collection)
    @collection.contacts.should eq([{ name: 'PLEASE CONTACT', phones: ['(865) 241-3952 (Direct Line)', '(865) 574-4665 (Fax)'], email: 'ornldaac@ornl.gov' }])
  end

  # No longer applicable
  xit 'uses the Online Access URL as description if no description exists' do
    online_access_urls = [{ 'URL' => 'http://www.example.com' }]
    @collection.online_access_urls = online_access_urls
    CollectionDetailsPresenterUmmJson.new(@collection)
    expect(@collection.online_access_urls).to eq([{ 'URL' => 'http://www.example.com', 'description' => 'http://www.example.com' }])
  end

  # No longer applicable
  xit 'converts no contacts to empty array' do
    CollectionDetailsPresenterUmmJson.new(@collection)
    @collection[:contacts].should eq([])
  end

  it 'converts RelatedUrls to a hash' 


  it 'converts RelatedUrls to highlighted urls' 

end

