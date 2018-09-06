# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::SourceFile::Line do
    context "a source line" do
      subject do
        SimpleCov::SourceFile::Line.new("# the ruby source", 5, 3)
      end

      it 'returns "# the ruby source" as src' 


      it "returns the same for source as for src" 


      it "has line number 5" 


      it "has equal line_number, line and number" 


      context "flagged as skipped!" do
        before do
          subject.skipped!
        end
        it "is not covered" 


        it "is skipped" 


        it "is not missed" 


        it "is not never" 


        it "status is skipped" 

      end
    end

    context "A source line with coverage" do
      subject do
        SimpleCov::SourceFile::Line.new("# the ruby source", 5, 3)
      end

      it "has coverage of 3" 


      it "is covered" 


      it "is not skipped" 


      it "is not missed" 


      it "is not never" 


      it "status is covered" 

    end

    context "A source line without coverage" do
      subject do
        SimpleCov::SourceFile::Line.new("# the ruby source", 5, 0)
      end

      it "has coverage of 0" 


      it "is not covered" 


      it "is not skipped" 


      it "is missed" 


      it "is not never" 


      it "status is missed" 

    end

    context "A source line with no code" do
      subject do
        SimpleCov::SourceFile::Line.new("# the ruby source", 5, nil)
      end

      it "has nil coverage" 


      it "is not covered" 


      it "is not skipped" 


      it "is not missed" 


      it "is never" 


      it "status is never" 

    end

    it "raises ArgumentError when initialized with invalid src" 


    it "raises ArgumentError when initialized with invalid line_number" 


    it "raises ArgumentError when initialized with invalid coverage" 

  end
end

