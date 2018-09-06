require "helper"

describe Thor::LineEditor, "on a system with Readline support" do
  before do
    @original_readline = ::Readline if defined? ::Readline
    silence_warnings { ::Readline = double("Readline") }
  end

  after do
    silence_warnings { ::Readline = @original_readline }
  end

  describe ".readline" do
    it "uses the Readline line editor" 

  end
end

describe Thor::LineEditor, "on a system without Readline support" do
  before do
    if defined? ::Readline
      @original_readline = ::Readline
      Object.send(:remove_const, :Readline)
    end
  end

  after do
    silence_warnings { ::Readline = @original_readline }
  end

  describe ".readline" do
    it "uses the Basic line editor" 

  end
end

