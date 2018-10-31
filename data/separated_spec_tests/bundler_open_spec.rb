# frozen_string_literal: true

RSpec.describe "bundle open" do
  before :each do
    install_gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rails"
    G
  end

  it "opens the gem with BUNDLER_EDITOR as highest priority" 


  it "opens the gem with VISUAL as 2nd highest priority" 


  it "opens the gem with EDITOR as 3rd highest priority" 


  it "complains if no EDITOR is set" 


  it "complains if gem not in bundle" 


  it "does not blow up if the gem to open does not have a Gemfile" 


  it "suggests alternatives for similar-sounding gems" 


  it "opens the gem with short words" 


  it "select the gem from many match gems" 


  it "allows selecting exit from many match gems" 


  it "performs an automatic bundle install" 


  it "opens the editor with a clean env" 

end

