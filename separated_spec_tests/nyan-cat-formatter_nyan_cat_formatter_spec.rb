require 'spec_helper'
require 'stringio'

describe NyanCatFormatter do

  before do
    rspec_bin = $0.split('/').last
    @output = StringIO.new
    if rspec_bin == 'rspec'
      @formatter = NyanCatFormatter.new(@output)
      @example = RSpec::Core::ExampleGroup.describe.example
    else
      formatter_options = OpenStruct.new(:colour => true, :dry_run => false, :autospec => nil)
      @formatter = NyanCatFormatter.new(formatter_options, @output)
      @example = Spec::Example::ExampleProxy.new("should pass")
      @formatter.instance_variable_set(:@example_group, OpenStruct.new(:description => "group"))
    end
    @formatter.start(2)
    @formatter.example_started(@example)
  end

  shared_examples 'a test' do
    it 'should call the increment method' 

  end

  describe 'passed, pending and failed' do

    before do
      allow(@formatter).to receive(:tick)
    end

    describe 'example_passed' do
      it_behaves_like 'a test'

      it 'should relax Nyan Cat' 


      it 'should update the scoreboard' 

    end

    describe 'example_pending' do
      it_behaves_like 'a test'

      it 'should increment the pending count' 


      it 'should alert Nyan Cat' 


    end

    describe 'example_failed' do
      it_behaves_like 'a test'

      it 'should increment the failure count' 


      it 'should alert Nyan Cat' 


      it 'should kill nyan if the specs are finished' 


    end
  end

  describe 'tick' do

    before do
      allow(@formatter).to receive(:current).and_return(1)
      allow(@formatter).to receive(:example_count).and_return(2)
      @formatter.tick
    end

    it 'should increment the current' 


    it 'should store the marks in an array' 


  end

  describe 'rainbowify' do

    it 'should increment the color index count' 


  end

  describe 'highlight' do

    it 'should rainbowify passing examples' 


    it 'should mark failing examples as red' 


    it 'should mark pending examples as yellow' 


  end

  describe 'start' do

    it 'should set the total amount of specs' 


    it 'should set the current to 0' 


  end

  describe "#format_duration" do
    it "should return just seconds for sub 60 seconds" 


    it "should remove that extra zero if it is not needed" 


    it "should plurlaize seconds" 


    it "add a minute if it is just over 60 seconds" 


    it "should pluralize minutes" 

  end

  describe "example width" do
    [15, 36, 60].each do |n|
      context "for #{n} examples" do
        before { @formatter.start(n) }

        [0.25, 0.5, 0.75].each do |p|
          i = (n * p).to_i
          before { i.times { @formatter.tick } }

          context "when in example #{i}" do
            it "should return 1 as the example width" 

          end
        end
      end
    end
  end
end

