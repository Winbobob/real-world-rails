require "spec_helper"

describe Rack::Test::UploadedFile do
  def test_file_path
    File.dirname(__FILE__) + "/../../fixtures/foo.txt"
  end

  it "responds to things that Tempfile responds to" 


end

