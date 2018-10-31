require "spec_helper"
require "radiant/admin_ui/region_partials"

class TemplateStub
  attr_accessor :block
  def capture(&block)
    @block = block
  end
end

describe Radiant::AdminUI::RegionPartials do
  before :each do
    @template = TemplateStub.new
    @rp = Radiant::AdminUI::RegionPartials.new(@template)
  end

  it "should return a string when the specified partial does not exist" 


  it "should expose partials via bracket accessor" 


  it "should capture a block when passed" 

end

