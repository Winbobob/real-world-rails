require 'spec_helper'

describe Listen::Listener do
  let(:adapter)             { double(Listen::Adapter, :start => true).as_null_object }
  let(:watched_directories) { [File.dirname(__FILE__), File.expand_path('../..', __FILE__)] }

  before do
    Listen::Adapter.stub(:select_and_initialize) { adapter }
    # Don't build a record of the files inside the base directory.
    Listen::DirectoryRecord.any_instance.stub(:build)
    Kernel.stub(:warn)
  end
  subject { described_class.new(watched_directories) }

  it_should_behave_like 'a listener to changes on a file-system'

  describe '#initialize' do
    context 'listening to a single directory' do
      let(:watched_directory)   { File.dirname(__FILE__) }
      let(:watched_directories) { nil }
      subject { described_class.new(watched_directory) }

      it 'sets the directories' 


      context 'with no options' do
        it 'sets the option for using relative paths in the callback to false' 

      end

      context 'with :relative_paths => false' do
        it 'sets the option for using relative paths in the callback to false' 

      end

      context 'with :relative_paths => true' do
        it 'sets the option for using relative paths in the callback to true' 

      end
    end

    context 'listening to multiple directories' do
      subject { described_class.new(watched_directories) }

      it 'sets the directories' 


      context 'with no options' do
        it 'sets the option for using relative paths in the callback to false' 

      end

      context 'with :relative_paths => false' do
        it 'sets the option for using relative paths in the callback to false' 

      end

      context 'with :relative_paths => true' do
        it 'warns' 


        it 'sets the option for using relative paths in the callback to false' 

      end
    end

    context 'with a directory' do
      let(:watched_directory)   { File.dirname(__FILE__) }
      it 'converts the passed path into an absolute path - #21' 

    end

    context 'with custom options' do
      let(:watched_directory)   { File.dirname(__FILE__) }
      let(:adapter_class) { double('adapter class') }

      let(:options) do
        {
          :ignore => /\.ssh/, :filter => [/.*\.rb/, /.*\.md/],
          :latency => 0.5, :force_polling => true, :relative_paths => true,
          :force_adapter => adapter_class
        }
      end
      subject { described_class.new(watched_directory, options) }

      it 'passes the custom ignored paths to the directory record' 


      it 'passes the custom filters to the directory record' 


      it 'sets adapter_options' 

    end
  end

  describe '#start' do
    it 'selects and initializes an adapter' 


    it 'builds the directory record' 

  end

  context 'with a started listener' do
    before do
      subject.stub(:initialize_adapter) { adapter }
      subject.start
    end

    describe '#unpause' do
      it 'rebuilds the directory record' 

    end
  end

  describe '#ignore'do
    it 'delegates the work to the directory record' 

  end

  describe '#ignore!'do
    it 'delegates the work to the directory record' 

  end

  describe '#filter' do
    it 'delegates the work to the directory record' 

  end

  describe '#filter!' do
    it 'delegates the work to the directory record' 

  end

  describe '#on_change' do
    let(:directories) { %w{dir1 dir2 dir3} }
    let(:changes)     { {:modified => [], :added => [], :removed => []} }
    let(:callback)    { Proc.new { @called = true } }

    before do
      @called = false
      subject.stub(:fetch_records_changes => changes)
    end

    it 'fetches the changes of all directories records' 


    context "with a callback raising an exception" do
      let(:callback) { Proc.new { raise 'foo' } }

      before do
        subject.change(&callback)
        subject.stub(:fetch_records_changes => { :modified => ['foo'], :added => [], :removed => [] } )
      end

      it "stops the adapter and warns" 


    end

    context 'with no changes to report' do
      if RUBY_VERSION[/^1.8/]
        it 'does not run the callback' 

      else
        it 'does not run the callback' 

      end
    end

    context 'with changes to report' do
      let(:changes) do
        {
          :modified => %w{path1}, :added => [], :removed => %w{path2}
        }
      end

      if RUBY_VERSION[/^1.8/]
        it 'runs the callback passing it the changes' 

      else
        it 'runs the callback passing it the changes' 

      end
    end
  end
end

