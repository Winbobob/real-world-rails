require 'rails_helper'
require 'wizard'

describe Wizard::Step do

  let(:wizard) { Wizard.new(Fabricate.build(:user)) }
  let(:step) { wizard.create_step('test-step') }

  it "supports fields and options" 


end

