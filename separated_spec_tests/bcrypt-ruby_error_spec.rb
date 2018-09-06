require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

describe "Errors" do

  shared_examples "descends from StandardError" do
    it "can be rescued as a StandardError" 

  end

  shared_examples "descends from BCrypt::Error" do
    it "can be rescued as a BCrypt::Error" 

  end

  describe BCrypt::Error do
    include_examples "descends from StandardError"
  end

  describe BCrypt::Errors::InvalidCost do
    include_examples "descends from BCrypt::Error"
  end

  describe BCrypt::Errors::InvalidHash do
    include_examples "descends from BCrypt::Error"
  end

  describe BCrypt::Errors::InvalidSalt do
    include_examples "descends from BCrypt::Error"
  end

  describe BCrypt::Errors::InvalidSecret do
    include_examples "descends from BCrypt::Error"
  end

end

