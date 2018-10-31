require "helper"
require "thor/actions"
require "tempfile"

describe Thor::Actions::CreateLink do
  before do
    @silence = false
    @hardlink_to = File.join(Dir.tmpdir, "linkdest.rb")
    ::FileUtils.rm_rf(destination_root)
    ::FileUtils.rm_rf(@hardlink_to)
  end

  def create_link(destination = nil, config = {}, options = {})
    @base = MyCounter.new([1, 2], options, :destination_root => destination_root)
    allow(@base).to receive(:file_name).and_return("rdoc")

    @tempfile = Tempfile.new("config.rb")

    @action = Thor::Actions::CreateLink.new(@base, destination, @tempfile.path,
                                            {:verbose => !@silence}.merge(config))
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
    it "creates a symbolic link for :symbolic => true" 


    it "creates a hard link for :symbolic => false" 


    it "creates a symbolic link by default" 


    it "does not create a link if pretending" 


    it "shows created status to the user" 


    it "does not show any information if log status is false" 

  end

  describe "#identical?" do
    it "returns true if the destination link exists and is identical" 

  end

  describe "#revoke!" do
    it "removes the symbolic link of non-existent destination" 

  end
end

