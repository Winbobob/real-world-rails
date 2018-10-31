require File.expand_path("../../spec_helper.rb", __FILE__)

describe UUIDTools::UUID, "when parsing" do
  it "should correctly parse the MAC address from a timestamp version UUID" 


  it "should correctly parse the variant from a timestamp version UUID" 


  it "should correctly parse the version from a timestamp version UUID" 


  it "should correctly parse the timestamp from a timestamp version UUID" 


  it "should not treat a timestamp version UUID as a nil UUID" 


  it "should not treat a timestamp version UUID as a random node UUID" 


  it "should treat a timestamp version UUID as a random node UUID " +
      "if there is no MAC address" do
    old_mac_address = UUIDTools::UUID.mac_address
    UUIDTools::UUID.mac_address = nil
    expect(UUIDTools::UUID.timestamp_create).to be_random_node_id
    UUIDTools::UUID.mac_address = old_mac_address
  end

  it "should correctly identify the nil UUID" 


  it "should correctly identify timestamp version UUIDs as valid" 


  it "should correctly identify random number version UUIDs as valid" 


  it "should correctly identify SHA1 hash version UUIDs as valid" 


  it "should correctly identify MD5 hash version UUIDs as valid" 


  it "should not identify the nil UUID as valid" 


  it "should allow for sorting of UUID arrays" 


  it "should allow for comparison of UUIDs" 


  it "should produce the correct hexdigest for a UUID" 


  it "should produce a sane hash value for a UUID" 


  it "should produce the correct URI for a UUID" 


  it "should correctly test UUID equality" 


  it "should correctly parse integers" 


  it "should correctly parse hexdigests" 

end

