require 'rails_helper'
require 'discourse_diff'

describe DiscourseDiff do

  describe "inline_html" do

    it "does not lead to XSS" 


    it "returns an empty div when no content is diffed" 


    it "returns the diffed content when there is no difference" 


    it "adds <ins> tags around added text" 


    it "adds <del> tags around removed text" 


    it "adds .diff-ins class when a paragraph is added" 


    it "adds .diff-del class when a paragraph is removed" 


    it "does not break diff on character references" 


  end

  describe "side_by_side_html" do

    it "returns two empty divs when no content is diffed" 


    it "returns the diffed content on both sides when there is no difference" 


    it "adds <ins> tags around added text on the right div" 


    it "adds <del> tags around removed text on the left div" 


    it "adds .diff-ins class when a paragraph is added" 


    it "adds .diff-del class when a paragraph is removed" 


    it "does not break diff on character references" 


  end

  describe "side_by_side_markdown" do

    it "returns an empty table when no content is diffed" 


    it "properly escape html tags" 


    it "returns the diffed content on both columns when there is no difference" 


    it "adds <ins> tags around added text on the second column" 


    it "adds <del> tags around removed text on the first column" 


    it "adds .diff-ins class when a paragraph is added" 


    it "adds .diff-del class when a paragraph is removed" 


  end

end

