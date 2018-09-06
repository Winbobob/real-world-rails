# -*- ruby encoding: utf-8 -*-

require 'spec_helper'

describe "Diff::LCS.traverse_sequences" do
  describe "callback with no finishers" do
    describe "over (seq1, seq2)" do
      before(:each) do
        @callback_s1_s2 = simple_callback_no_finishers
        Diff::LCS.traverse_sequences(seq1, seq2, @callback_s1_s2)

        @callback_s2_s1 = simple_callback_no_finishers
        Diff::LCS.traverse_sequences(seq2, seq1, @callback_s2_s1)
      end

      it "has the correct LCS result on left-matches" 


      it "has the correct LCS result on right-matches" 


      it "has the correct skipped sequences with the left sequence" 


      it "has the correct skipped sequences with the right sequence" 


      it "does not have anything done markers from the left or right sequences" 

    end

    describe "over (hello, hello)" do
      before(:each) do
        @callback = simple_callback_no_finishers
        Diff::LCS.traverse_sequences(hello, hello, @callback)
      end

      it "has the correct LCS result on left-matches" 


      it "has the correct LCS result on right-matches" 


      it "has the correct skipped sequences with the left sequence", :only => true do
        expect(@callback.discards_a).to be_empty
      end

      it "has the correct skipped sequences with the right sequence" 


      it "does not have anything done markers from the left or right sequences" 

    end

    describe "over (hello_ary, hello_ary)" do
      before(:each) do
        @callback = simple_callback_no_finishers
        Diff::LCS.traverse_sequences(hello_ary, hello_ary, @callback)
      end

      it "has the correct LCS result on left-matches" 


      it "has the correct LCS result on right-matches" 


      it "has the correct skipped sequences with the left sequence" 


      it "has the correct skipped sequences with the right sequence" 


      it "does not have anything done markers from the left or right sequences" 

    end
  end

  describe "callback with finisher" do
    before(:each) do
      @callback_s1_s2 = simple_callback
      Diff::LCS.traverse_sequences(seq1, seq2, @callback_s1_s2)
      @callback_s2_s1 = simple_callback
      Diff::LCS.traverse_sequences(seq2, seq1, @callback_s2_s1)
    end

    it "has the correct LCS result on left-matches" 


    it "has the correct LCS result on right-matches" 


    it "has the correct skipped sequences for the left sequence" 


    it "has the correct skipped sequences for the right sequence" 


    it "has done markers differently-sized sequences" 

  end
end

