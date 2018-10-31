require "helper"
require "thor/actions"

describe Thor::Actions::CreateFile do
  before do
    @silence = false
    ::FileUtils.rm_rf(destination_root)
  end

  def create_file(destination = nil, config = {}, options = {})
    @base = MyCounter.new([1, 2], options, :destination_root => destination_root)
    allow(@base).to receive(:file_name).and_return("rdoc")

    @action = Thor::Actions::CreateFile.new(@base, destination, "CONFIGURATION", {:verbose => !@silence}.merge(config))
  end

  def invoke!
    capture(:stdout) { @action.invoke! }
  end

  def revoke!
    capture(:stdout) { @action.revoke! }
  end

  def silence!
    @silence = true
  end

  describe "#invoke!" do
    it "creates a file" 


    it "does not create a file if pretending" 


    it "shows created status to the user" 


    it "does not show any information if log status is false" 


    it "returns the given destination" 


    it "converts encoded instructions" 


    describe "when file exists" do
      before do
        create_file("doc/config.rb")
        invoke!
      end

      describe "and is identical" do
        it "shows identical status" 

      end

      describe "and is not identical" do
        before do
          File.open(File.join(destination_root, "doc/config.rb"), "w") { |f| f.write("FOO = 3") }
        end

        it "shows forced status to the user if force is given" 


        it "shows skipped status to the user if skip is given" 


        it "shows forced status to the user if force is configured" 


        it "shows skipped status to the user if skip is configured" 


        it "shows conflict status to the user" 


        it "creates the file if the file collision menu returns true" 


        it "skips the file if the file collision menu returns false" 


        it "executes the block given to show file content" 

      end
    end

    context "when file exists and it causes a file clash" do
      before do
        create_file("doc/config")
        invoke!
      end

      it "generates a file clash" 

    end

    context "when directory exists and it causes a file clash" do
      before do
        create_file("doc/config/hello")
        invoke!
      end

      it "generates a file clash" 

    end
  end

  describe "#revoke!" do
    it "removes the destination file" 


    it "does not raise an error if the file does not exist" 

  end

  describe "#exists?" do
    it "returns true if the destination file exists" 

  end

  describe "#identical?" do
    it "returns true if the destination file exists and is identical" 

  end
end

