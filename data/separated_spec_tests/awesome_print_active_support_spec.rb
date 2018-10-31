require 'spec_helper'

RSpec.describe 'AwesomePrint::ActiveSupport', skip: -> { !ExtVerifier.has_rails? }.call do
  before do
    @ap = AwesomePrint::Inspector.new
  end

  it 'should format ActiveSupport::TimeWithZone as regular Time' 


  it 'should format HashWithIndifferentAccess as regular Hash' 


  # ActiveSupport sticks in instance variables to the date object. Make sure
  # we ignore that and format Date instance as regular date.
  it 'should formate Date object as date' 

end

