require 'rails_helper'
require 'setup_concepts'
require 'download_concepts'
require 'create_concepts'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

describe 'Downloading the concepts' do
  before(:all) do
    @setup = Setup::DownloadConcepts.new
  end

  it "should have an attribute concepts" 


  before(:each) do
    VCR.use_cassette('fetching concepts') do
      @response = @setup.fetch_concepts()
    end
  end

  it "should successfully make a http request" 


  it "the response should be a string" 


  it "can convert the string response to JSON" 


  it "hash of data has a list of concepts" 


  it "has a hash that represents a concepts inside the list" 


  it "stores the data" 

end

describe "Creating the concepts" do
  context "when there is a child and parent concept" do
    before(:each) do
      @parent = {"id"=>1, "name"=>"Capitalization", "uid"=>"BRTGfOy7FGG4LB49eIxJQg", "parent_id"=>nil, "level"=>2}
      @child = {"id"=>2, "name"=>"Greece", "uid"=>"GPzZYKvZ2nSKmu7zC540bA", "parent_id"=>1, "level"=>0}
      @creator = Setup::CreateConcepts.new([@child, @parent])
    end

    it "can find its parent concept" 


    it "can find or create its parent in the database" 


    it "should have a valid parent if required" 


    it "should be able add the concepts array into the db" 

  end

  context "when there is a child, parent and grandparent concept" do
    before(:each) do
      @grandparent = {"id"=>3, "name"=>"Alphabet", "uid"=>"BRTGfOy7FGG4LB49eIxJQf", "parent_id"=>nil, "level"=>1}
      @parent = {"id"=>1, "name"=>"Capitalization", "uid"=>"BRTGfOy7FGG4LB49eIxJQg", "parent_id"=>3, "level"=>2}
      @child = {"id"=>2, "name"=>"Greece", "uid"=>"GPzZYKvZ2nSKmu7zC540bA", "parent_id"=>1, "level"=>0}
      @creator = Setup::CreateConcepts.new([@child, @parent, @grandparent])
    end

    it "should be able recursively set parents" 

  end
end

