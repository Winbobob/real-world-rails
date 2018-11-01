require_relative 'helper'
require 'tempfile'

describe Pry do
  before do
    Pry.history.clear

    @saved_history = "1\n2\n3\ninvalid\0 line\n"

    Pry.history.loader = proc do |&blk|
      @saved_history.lines.each { |l| blk.call(l) }
    end

    Pry.load_history
  end

  after do
    Pry.history.clear
    Pry.history.restore_default_behavior
    Pry.history.instance_variable_set(:@original_lines, 0)
  end

  describe '#push' do
    it "does not record duplicated lines" 


    it "does not record lines that contain a NULL byte" 


    it "does not record empty lines" 

  end

  describe "#clear" do
    before do
      @old_file = Pry.config.history.file
      @hist_file_path = File.expand_path('spec/fixtures/pry_history')
      Pry.config.history.file = @hist_file_path
      Pry.history.clear
      Pry.history.restore_default_behavior
      Pry.load_history
    end

    after do
      Pry.config.history.file = @old_file
    end

    it "clears this session's history" 


    it "doesn't affect the contents of the history file" 

  end

  describe "#history_line_count" do
    it "counts entries in history" 

  end

  describe "#restore_default_behavior" do
    it "restores loader" 


    it "restores saver" 


    it "restores pusher" 


    it "restores clearer" 

  end

  describe "#session_line_count" do
    it "returns the number of lines in history from just this session" 

  end

  describe ".load_history" do
    it "reads the contents of the file" 

  end

  describe "saving to a file" do
    before do
      @histfile = Tempfile.new(["pryhistory", "txt"])
      @history = Pry::History.new(file_path: @histfile.path)
      Pry.config.history.should_save = true
      @history.pusher = proc{ }
    end

    after do
      @histfile.close(true)
      Pry.config.history.should_save = false
    end

    it "saves lines to a file as they are written" 


    it "interleaves lines from many places" 


    it "should not write histignore words to the history file" 

  end

  describe "expanding the history file path" do
    before { Pry.config.history.should_save = true  }
    after  { Pry.config.history.should_save = false }

    it "recognizes ~ (#1262)" 

  end

  describe "file io errors" do
    let(:history) { Pry::History.new(file_path: file_path) }
    let(:file_path) { Tempfile.new("pry_history_spec").path }

    [Errno::EACCES, Errno::ENOENT].each do |error_class|
      it "handles #{ error_class } failure to read from history" 


      it "handles #{ error_class } failure to write history" 

    end
  end
end

