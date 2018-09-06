require 'rails_helper'
require 'shellwords'

describe Git do
  let(:args) { ["radar", "markdown_book_test"] }
  let(:test_repo) { Git.path + args.join("/") }

  before do
    FileUtils.rm_rf(Git.path + args.join("/")) if File.exist?(test_repo)
  end

  it "returns the repository path" 


  it "checks to see if a repository exists" 


  it "initializes a new repository" 


  it "updates an existing repository" 

end

