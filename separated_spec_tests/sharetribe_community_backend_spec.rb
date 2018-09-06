require 'spec_helper'

describe I18n::Backend::CommunityBackend do

  before(:each) do
    @backend = I18n.backend
    I18n.backend = I18n::Backend::CommunityBackend.new({}) # Hash as an empty key-value store
  end

  after(:each) do
    # clean up
    I18n.backend = @backend
  end

  default_locales = [:en, :fi]

  it "stores and looks translations per community" 


  it "optionally doesn't clear stored translations on community change" 


  it "raises error if community is nil" 


  it "falls back to another locale in use in case translation is not available" 


  it "fails nicely in case no translation is available" 


  it "returns previous community and locales" 


  it "doesn't change community if new community_id equals old community_id and clear: false" 


  it "changes community if new community_id equals old community_id and clear: true" 


end

