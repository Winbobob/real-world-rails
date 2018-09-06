require "helper"
require "thor/runner"

describe Thor::Runner do
  def when_no_thorfiles_exist
    old_dir = Dir.pwd
    Dir.chdir ".."
    delete = Thor::Base.subclasses.select { |e| e.namespace == "default" }
    delete.each { |e| Thor::Base.subclasses.delete e }
    yield
    Thor::Base.subclasses.concat delete
    Dir.chdir old_dir
  end

  describe "#help" do
    it "shows information about Thor::Runner itself" 


    it "shows information about a specific Thor::Runner command" 


    it "shows information about a specific Thor class" 


    it "shows information about a specific command from a specific Thor class" 


    it "shows information about a specific Thor group class" 


    it "raises error if a class/command cannot be found" 


    it "raises error if a class/command cannot be found for a setup without thorfiles" 

  end

  describe "#start" do
    it "invokes a command from Thor::Runner" 


    it "invokes a command from a specific Thor class" 


    it "invokes the default command from a specific Thor class if none is specified" 


    it "forwards arguments to the invoked command" 


    it "invokes commands through shortcuts" 


    it "invokes a Thor::Group" 


    it "raises an error if class/command can't be found" 


    it "raises an error if class/command can't be found in a setup without thorfiles" 


    it "does not swallow NoMethodErrors that occur inside the called method" 


    it "does not swallow Thor::Group InvocationError" 


    it "does not swallow Thor InvocationError" 

  end

  describe "commands" do
    before do
      @location = "#{File.dirname(__FILE__)}/fixtures/command.thor"
      @original_yaml = {
        "random" => {
          :location  => @location,
          :filename  => "4a33b894ffce85d7b412fc1b36f88fe0",
          :namespaces => %w(amazing)
        }
      }

      root_file = File.join(Thor::Util.thor_root, "thor.yml")

      # Stub load and save to avoid thor.yaml from being overwritten
      allow(YAML).to receive(:load_file).and_return(@original_yaml)
      allow(File).to receive(:exist?).with(root_file).and_return(true)
      allow(File).to receive(:open).with(root_file, "w")
    end

    describe "list" do
      it "gives a list of the available commands" 


      it "gives a list of the available Thor::Group classes" 


      it "can filter a list of the available commands by --group" 


      it "can skip all filters to show all commands using --all" 


      it "doesn't list superclass commands in the subclass" 


      it "presents commands in the default namespace with an empty namespace" 


      it "runs commands with an empty namespace from the default namespace" 


      it "runs groups even when there is a command with the same name" 


      it "runs commands with no colon in the default namespace" 

    end

    describe "uninstall" do
      before do
        path = File.join(Thor::Util.thor_root, @original_yaml["random"][:filename])
        expect(FileUtils).to receive(:rm_rf).with(path)
      end

      it "uninstalls existing thor modules" 

    end

    describe "installed" do
      before do
        expect(Dir).to receive(:[]).and_return([])
      end

      it "displays the modules installed in a pretty way" 

    end

    describe "install/update" do
      before do
        allow(FileUtils).to receive(:mkdir_p)
        allow(FileUtils).to receive(:touch)
        allow(Thor::LineEditor).to receive(:readline).and_return("Y")

        path = File.join(Thor::Util.thor_root, Digest::MD5.hexdigest(@location + "random"))
        expect(File).to receive(:open).with(path, "w")
      end

      it "updates existing thor files" 


      it "installs thor files" 

    end
  end
end

