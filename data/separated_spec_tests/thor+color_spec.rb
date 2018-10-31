require "helper"

describe Thor::Shell::Color do
  def shell
    @shell ||= Thor::Shell::Color.new
  end

  before do
    allow($stdout).to receive(:tty?).and_return(true)
    allow_any_instance_of(StringIO).to receive(:tty?).and_return(true)
  end

  describe "#ask" do
    it "sets the color if specified and tty?" 


    it "handles an Array of colors" 


    it "supports the legacy color syntax" 

  end

  describe "#say" do
    it "set the color if specified and tty?" 


    it "does not set the color if output is not a tty" 


    it "does not use a new line even with colors" 


    it "handles an Array of colors" 


    it "supports the legacy color syntax" 

  end

  describe "#say_status" do
    it "uses color to say status" 

  end

  describe "#set_color" do
    it "colors a string with a foreground color" 


    it "colors a string with a background color" 


    it "colors a string with a bold color" 


    it "does nothing when there are no colors" 


    it "does nothing when the terminal does not support color" 

  end

  describe "#file_collision" do
    describe "when a block is given" do
      it "invokes the diff command" 

    end
  end
end

