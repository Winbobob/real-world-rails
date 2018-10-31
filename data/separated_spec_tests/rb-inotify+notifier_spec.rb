require 'spec_helper'
require 'tmpdir'
require 'concurrent'

describe INotify::Notifier do
  describe "instance" do
    around do |block|
      Dir.mktmpdir do |dir|
        @root = Pathname.new(dir)
        @notifier = INotify::Notifier.new

        begin
          block.call
        ensure
          @notifier.close
        end
      end
    end

    let(:dir) do
      @root.join("foo").tap(&:mkdir)
    end

    let(:another_dir) do
      @root.join("bar").tap(&:mkdir)
    end

    it "stops" 


    describe :process do
      it "gets events" 


      it "gets simultaneous events" 


      it "separates events between watches" 

    end

    describe :run do
      it "processes repeatedly until stopped" 

    end

    describe :fd do
      it "returns an integer" 

    end

    describe :to_io do
      it "returns a ruby IO" 


      it "matches the fd" 


      it "caches its result" 


      it "is selectable" 

    end

    private

    def recording(dir, *flags, callback: nil)
      events = []
      @notifier.watch(dir.to_s, *flags) do |event|
        events << event
        yield if block_given?
      end

      events
    end
  end

  describe "mixed instances" do
    it "doesn't tangle fds" 

  end
end

