require 'spec_helper'

describe Locomotive::Configuration do

  before { @old_config = Locomotive.config.dup }

  it 'allows a different value for the reserved site handles' 


  after { Locomotive.config = @old_config }

end

