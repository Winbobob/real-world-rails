# -*- ruby encoding: utf-8 -*-

require 'spec_helper'

describe Diff::LCS::Internals, ".lcs" do
  include Diff::LCS::SpecHelper::Matchers

  it "returns a meaningful LCS array with (seq1, seq2)" 


  it "returns all indexes with (hello, hello)" 


  it "returns all indexes with (hello_ary, hello_ary)" 

end

describe Diff::LCS, ".LCS" do
  include Diff::LCS::SpecHelper::Matchers

  it "returns the correct compacted values from Diff::LCS.LCS" 


  it "is transitive" 


  it "returns %W(h e l l o) with (hello, hello)" 


  it "returns hello_ary with (hello_ary, hello_ary)" 

end

