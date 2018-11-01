require "spec_helper"

describe Capistrano::DSL::Paths do
  let(:dsl) { Class.new.extend Capistrano::DSL }
  let(:parent) { Pathname.new("/var/shared") }
  let(:paths) { Class.new.extend Capistrano::DSL::Paths }

  let(:linked_dirs) { %w{log public/system} }
  let(:linked_files) { %w{config/database.yml log/my.log log/access.log} }

  before do
    dsl.set(:deploy_to, "/var/www")
  end

  describe "#linked_dirs" do
    subject { paths.linked_dirs(parent) }

    before do
      paths.expects(:fetch).with(:linked_dirs).returns(linked_dirs)
    end

    it "returns the full pathnames" 

  end

  describe "#linked_files" do
    subject { paths.linked_files(parent) }

    before do
      paths.expects(:fetch).with(:linked_files).returns(linked_files)
    end

    it "returns the full pathnames" 

  end

  describe "#linked_file_dirs" do
    subject { paths.linked_file_dirs(parent) }

    before do
      paths.expects(:fetch).with(:linked_files).returns(linked_files)
    end

    it "returns the full paths names of the parent dirs" 

  end

  describe "#linked_dir_parents" do
    subject { paths.linked_dir_parents(parent) }

    before do
      paths.expects(:fetch).with(:linked_dirs).returns(linked_dirs)
    end

    it "returns the full paths names of the parent dirs" 

  end

  describe "#release path" do
    subject { dsl.release_path }

    context "where no release path has been set" do
      before do
        dsl.delete(:release_path)
      end

      it "returns the `current_path` value" 

    end

    context "where the release path has been set" do
      before do
        dsl.set(:release_path, "/var/www/release_path")
      end

      it "returns the set `release_path` value" 

    end
  end

  describe "#set_release_path" do
    let(:now) { Time.parse("Oct 21 16:29:00 2015") }
    subject { dsl.release_path }

    context "without a timestamp" do
      before do
        dsl.env.expects(:timestamp).returns(now)
        dsl.set_release_path
      end

      it "returns the release path with the current env timestamp" 

    end

    context "with a timestamp" do
      before do
        dsl.set_release_path("timestamp")
      end

      it "returns the release path with the timestamp" 

    end
  end

  describe "#releases_path" do
    subject { paths.releases_path }

    context "with custom releases directory" do
      before do
        paths.expects(:fetch).with(:releases_directory, "releases").returns("test123")
        paths.expects(:fetch).with(:deploy_to).returns("/var/www")
      end

      it "returns the releases path with the custom directory" 

    end
  end

  describe "#shared_path" do
    subject { paths.shared_path }

    context "with custom shared directory" do
      before do
        paths.expects(:fetch).with(:shared_directory, "shared").returns("test123")
        paths.expects(:fetch).with(:deploy_to).returns("/var/www")
      end

      it "returns the shared path with the custom directory" 

    end
  end

  describe "#deploy_config_path" do
    subject { dsl.deploy_config_path.to_s }

    context "when not specified" do
      before do
        dsl.delete(:deploy_config_path)
      end

      it 'returns "config/deploy.rb"' 

    end

    context "when the variable :deploy_config_path is set" do
      before do
        dsl.set(:deploy_config_path, "my/custom/path.rb")
      end

      it "returns the custom path" 

    end
  end

  describe "#stage_config_path" do
    subject { dsl.stage_config_path.to_s }

    context "when not specified" do
      before do
        dsl.delete(:stage_config_path)
      end

      it 'returns "config/deploy"' 

    end

    context "when the variable :stage_config_path is set" do
      before do
        dsl.set(:stage_config_path, "my/custom/path")
      end

      it "returns the custom path" 

    end
  end

  describe "#repo_path" do
    subject { dsl.repo_path.to_s }

    context "when not specified" do
      before do
        dsl.delete(:repo_path)
      end

      it 'returns the default #{deploy_to}/repo' 

    end

    context "when the variable :repo_path is set" do
      before do
        dsl.set(:repo_path, "my/custom/path")
      end

      it "returns the custom path" 

    end
  end
end

