# frozen_string_literal: true

RSpec.describe "bundle licenses" do
  before :each do
    install_gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rails"
      gem "with_license"
    G
  end

  it "prints license information for all gems in the bundle" 


  it "performs an automatic bundle install" 

end

