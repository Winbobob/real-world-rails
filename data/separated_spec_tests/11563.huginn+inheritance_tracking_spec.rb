require 'rails_helper'
require 'inheritance_tracking'

describe InheritanceTracking do
  class Class1
    include InheritanceTracking
  end

  class Class2 < Class1; end
  class Class3 < Class1; end

  it "tracks subclasses" 


  it "can be temporarily overridden with #with_subclasses" 

end

