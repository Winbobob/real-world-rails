require_relative 'helper'

describe "Pry.run_command" do
  before do
    o = Object.new
    def o.drum
      "roken is dodelijk"
    end
    @context = Pry.binding_for(o)
  end

  it 'performs a simple ls' 


  # This is a regression test as 0.9.11 broke this behaviour
  it 'can perform a show-source' 

end

