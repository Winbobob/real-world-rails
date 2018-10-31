# frozen_string_literal: true

Capybara::SpecHelper.spec '#save_page' do
  let(:alternative_path) { File.join(Dir.pwd, "save_and_open_page_tmp") }
  before do
    @session.visit("/foo")
  end

  after do
    Capybara.save_path = nil
    Dir.glob("capybara-*.html").each do |file|
      FileUtils.rm(file)
    end
    FileUtils.rm_rf alternative_path
  end

  it "saves the page in the root directory" 


  it "generates a sensible filename" 


  it "can store files in a specified directory" 


  it "uses the given filename" 


  it "can store files in a specified directory with a given filename" 


  it "can store files in a specified directory with a given relative filename" 


  it "returns an absolute path in pwd" 


  it "returns an absolute path in given directory" 


  context "asset_host contains a string" do
    before { Capybara.asset_host = "http://example.com" }
    after { Capybara.asset_host = nil }

    it "prepends base tag with value from asset_host to the head" 


    it "doesn't prepend base tag to pages when asset_host is nil" 


    it "doesn't prepend base tag to pages which already have it" 


    it "executes successfully even if the page is missing a <head>" 

  end
end

