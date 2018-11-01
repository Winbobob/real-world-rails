require 'rails_helper'
require_dependency 'site_settings/local_process_provider'

describe SiteSettings::LocalProcessProvider do

  def expect_same_setting(actual, expected)
    expect(actual.name).to eq(expected.name)
    expect(actual.value).to eq(expected.value)
    expect(actual.data_type).to eq(expected.data_type)
  end

  let :provider do
    SiteSettings::LocalProcessProvider.new
  end

  def setting(name, value, data_type)
    OpenStruct.new.tap do |setting|
      setting.name = name
      setting.value = value
      setting.data_type = data_type
    end
  end

  describe "all" do
    it "starts off empty" 


    it "can allows additional settings" 


    it "does not leak new stuff into list" 

  end

  describe "find" do
    it "starts off empty" 


    it "can find a new setting" 


    it "can amend a setting" 

  end

  describe "destroy" do
    it "can destroy a setting" 

  end

  it "returns the correct site name" 

end

