require "helper"

describe Thor::LineEditor::Readline do
  before do
    unless defined? ::Readline
      ::Readline = double("Readline")
      allow(::Readline).to receive(:completion_append_character=).with(nil)
    end
  end

  describe ".available?" do
    it "returns true when ::Readline exists" 


    it "returns false when ::Readline does not exist" 

  end

  describe "#readline" do
    it "invokes the readline library" 


    it "supports the add_to_history option" 


    it "provides tab completion when given a limited_to option" 


    it "provides path tab completion when given the path option" 


    it "uses STDIN when asked not to echo input" 

  end
end

