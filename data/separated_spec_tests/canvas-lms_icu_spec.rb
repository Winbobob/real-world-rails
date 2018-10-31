#
# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Canvas::ICU do
  shared_examples_for "Collator" do
    describe ".collate_by" do
      it "should work" 


      it "should handle CanvasSort::First" 

    end

    describe ".collation_key" do
      it "should return something that's comparable" 


      it "should pass-thru CanvasSort::First" 

    end

    describe ".compare" do
      it "should work" 


      it "should handle CanvasSort::First" 

    end

    describe ".collate" do
      it "should work" 


      it "should at the least be case insensitive" 


      it "should not ignore punctuation" 

    end
  end

  context "NaiveCollator" do
    include_examples "Collator"

    before do
      allow(Canvas::ICU).to receive(:collator).and_return(Canvas::ICU::NaiveCollator)
    end
  end

  context "ICU" do
    include_examples "Collator"

    before do
      if (ICU::Lib.version rescue false)
        if Canvas::ICU.collator == Canvas::ICU::NaiveCollator
          raise "ICU appears to be installed, but we didn't load it correctly"
        end
      else
        skip if Canvas::ICU.collator == Canvas::ICU::NaiveCollator
      end
    end

    it "sorts several examples correctly" 

  end
end

