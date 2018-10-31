require File.dirname(__FILE__) + '/../spec_helper'

describe PlacesController, "index" do

  it "should return places" 


  it "should return places where taxa occur" 


  it "should not return places where taxa do not occur" 


  it "should return places where taxa occur with establishment means" 


  it "should include endemics in searches for native" 


  it "should return places with geometries intersecting lat/lon" 


  it "should not return places without geometries intersecting lat/lon" 

end

describe PlacesController, "search" do
  before { enable_elastic_indexing(Place) }
  after { disable_elastic_indexing(Place) }
  it "should filter by with_geom" 

end


describe PlacesController, "autocomplete" do
  before { enable_elastic_indexing(Place) }
  after { disable_elastic_indexing(Place) }
  it "be able to find places with short words and diacritics" 


  it "should filter by with_geom" 

  it "should filter by with_checklist" 

end

