require_relative "helper"
describe "Pry::Pager" do
  describe "PageTracker" do
    before do
      @pt = Pry::Pager::PageTracker.new(10, 10)
    end

    def record_short_line
      @pt.record "012345678\n"
    end

    def record_long_line
      @pt.record "0123456789012\n"
    end

    def record_multiline
      @pt.record "0123456789012\n01\n"
    end

    def record_string_without_newline
      @pt.record "0123456789"
    end

    def record_string_with_color_codes
      @pt.record(CodeRay.scan("0123456789", :ruby).term + "\n")
    end

    it "records short lines that don't add up to a page" 


    it "records short lines that do add up to a page" 


    it "treats a long line as taking up more than one row" 


    it "records a string with an embedded newline" 


    it "doesn't count a line until it ends" 


    it "doesn't count ansi color codes towards length" 

  end
end

