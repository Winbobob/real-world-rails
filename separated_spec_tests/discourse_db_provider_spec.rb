require 'rails_helper'
require_dependency 'site_settings/db_provider'

describe SiteSettings::DbProvider do

  def expect_same_setting(actual, expected)
    expect(actual.name).to eq(expected.name)
    expect(actual.value).to eq(expected.value)
    expect(actual.data_type).to eq(expected.data_type)
  end

  let :provider do
    SiteSettings::DbProvider.new(SiteSetting)
  end

  # integration test, requires db access
  it "act correctly" 


  it "returns the correct site name" 

end

