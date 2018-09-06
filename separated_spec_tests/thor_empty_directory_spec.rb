require "helper"
require "thor/actions"

describe Thor::Actions::EmptyDirectory do
  before do
    ::FileUtils.rm_rf(destination_root)
  end

  def empty_directory(destination, options = {})
    @action = Thor::Actions::EmptyDirectory.new(base, destination)
  end

  def invoke!
    capture(:stdout) { @action.invoke! }
  end

  def revoke!
    capture(:stdout) { @action.revoke! }
  end

  def base
    @base ||= MyCounter.new([1, 2], {}, :destination_root => destination_root)
  end

  describe "#destination" do
    it "returns the full destination with the destination_root" 


    it "takes relative root into account" 

  end

  describe "#relative_destination" do
    it "returns the relative destination to the original destination root" 

  end

  describe "#given_destination" do
    it "returns the destination supplied by the user" 

  end

  describe "#invoke!" do
    it "copies the file to the specified destination" 


    it "shows created status to the user" 


    it "does not create a directory if pretending" 


    describe "when directory exists" do
      it "shows exist status" 

    end
  end

  describe "#revoke!" do
    it "removes the destination file" 

  end

  describe "#exists?" do
    it "returns true if the destination file exists" 

  end

  context "protected methods" do
    describe "#convert_encoded_instructions" do
      before do
        empty_directory("test_dir")
        allow(@action.base).to receive(:file_name).and_return("expected")
      end

      it "accepts and executes a 'legal' %\w+% encoded instruction" 


      it "accepts and executes a private %\w+% encoded instruction" 


      it "ignores an 'illegal' %\w+% encoded instruction" 


      it "ignores incorrectly encoded instruction" 

    end
  end
end

