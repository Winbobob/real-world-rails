require 'spec_helper'

describe HashUtils do

  describe "#compact" do
    it "returns hash without nils" 


    it "does not mutate the original hash" 

  end


  it "#map_keys" 


  it "#map_values" 


  it "#rename_keys" 


  it "#symbolize_keys" 


  it "#pluck" 


  it "#sub" 


  it "#sub_eq" 


  describe "#transpose" do
    let(:h) { {a: [1, 2, 3], b: [2, 3, 4], c: [2]} }

    it "transposes hash keys and values" 


    it "transposing twice results original hash" 

  end

  describe "#flatten" do
    it "makes deep structure flat" 


    it "throws if key is not symbol or if it contains a dot" 

  end
end

