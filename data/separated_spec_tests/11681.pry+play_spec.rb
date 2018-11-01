# This command needs a TONNE more tests for it, but i can't figure out
# how to do them yet, and i really want to release. Sorry. Someone
# come along and do a better job.

require_relative '../helper'

describe "play" do
  before do
    @o = Object.new
    @t = pry_tester(@o)
  end

  describe "with an argument" do

    # can't think of a f*cking way to test this!!
    describe "implied file" do
      # it 'should play from the file associated with the current binding' do
      #   # require 'fixtures/play_helper'
      # end


      # describe "integer" do
      #   it "should process one line from _pry_.last_file" do
      #     @t.process_command 'play --lines 1', @eval_str
      #     @eval_str.should =~ /bing = :bing\n/
      #   end
      # end

      # describe "range" do
      #   it "should process multiple lines at once from _pry_.last_file" do
      #     @t.process_command 'play --lines 1..3', @eval_str
      #     [/bing = :bing\n/, /bang = :bang\n/, /bong = :bong\n/].each { |str|
      #       @eval_str.should =~ str
      #     }
      #   end
    end
  end

  describe "playing a file" do
    it 'should play a file' 



    it 'should output file contents with print option' 

  end

  describe "whatever" do
    before do
      def @o.test_method
        :test_method_content
      end
    end

    it 'should play documentation with the -d switch' 


    it 'should restrict -d switch with --lines' 


    it 'has pretty error messages when -d cant find object' 


    it 'should play a method (a single line)' 


    it 'should properly reindent lines' 


    it 'should APPEND to the input buffer when playing a method line, not replace it' 


    it 'should play a method (multiple lines)' 


    describe "play -i" do
      it 'should play multi-ranged input expressions' 

    end

    describe "play -e" do
      it 'should run an expression from given line number' 

    end
  end
end

