# coding: utf-8
require "helper"

describe Thor::Shell::Basic do
  def shell
    @shell ||= Thor::Shell::Basic.new
  end

  describe "#padding" do
    it "cannot be set to below zero" 

  end

  describe "#indent" do
    it "sets the padding temporarily" 


    it "derives padding from original value" 


    it "accepts custom indentation amounts" 


    it "increases the padding when nested" 

  end

  describe "#ask" do
    it "prints a message to the user and gets the response" 


    it "prints a message to the user prefixed with the current padding" 


    it "prints a message and returns nil if EOF is given as input" 


    it "prints a message to the user and does not echo stdin if the echo option is set to false" 


    it "prints a message to the user with the available options and determines the correctness of the answer" 


    it "prints a message to the user with the available options and reasks the question after an incorrect response" 


    it "prints a message to the user containing a default and sets the default if only enter is pressed" 


    it "prints a message to the user with the available options and reasks the question after an incorrect response and then returns the default" 

  end

  describe "#yes?" do
    it "asks the user and returns true if the user replies yes" 


    it "asks the user and returns false if the user replies no" 


    it "asks the user and returns false if the user replies with an answer other than yes or no" 

  end

  describe "#no?" do
    it "asks the user and returns true if the user replies no" 


    it "asks the user and returns false if the user replies yes" 


    it "asks the user and returns false if the user replies with an answer other than yes or no" 

  end

  describe "#say" do
    it "prints a message to the user" 


    it "prints a message to the user without new line if it ends with a whitespace" 


    it "does not use a new line with whitespace+newline embedded" 


    it "prints a message to the user without new line" 


    it "coerces everything to a string before printing" 

  end

  describe "#say_status" do
    it "prints a message to the user with status" 


    it "always uses new line" 


    it "does not print a message if base is muted" 


    it "does not print a message if base is set to quiet" 


    it "does not print a message if log status is set to false" 


    it "uses padding to set message's left margin" 

  end

  describe "#print_in_columns" do
    before do
      @array = [1_234_567_890]
      @array += ("a".."e").to_a
    end

    it "prints in columns" 

  end

  describe "#print_table" do
    before do
      @table = []
      @table << ["abc", "#123", "first three"]
      @table << ["", "#0", "empty"]
      @table << ["xyz", "#786", "last three"]
    end

    it "prints a table" 


    it "prints a table with indentation" 


    it "uses maximum terminal width" 


    it "honors the colwidth option" 


    it "prints tables with implicit columns" 


    it "prints a table with small numbers and right-aligns them" 


    it "doesn't output extra spaces for right-aligned columns in the last column" 


    it "prints a table with big numbers" 

  end

  describe "#file_collision" do
    it "shows a menu with options" 


    it "outputs a new line and returns true if stdin is closed" 


    it "returns true if the user chooses default option" 


    it "returns false if the user chooses no" 


    it "returns true if the user chooses yes" 


    it "shows help usage if the user chooses help" 


    it "quits if the user chooses quit" 


    it "always returns true if the user chooses always" 


    describe "when a block is given" do
      it "displays diff options to the user" 


      it "invokes the diff command" 

    end
  end
end

