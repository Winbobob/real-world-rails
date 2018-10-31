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
require 'spec_helper'
require_relative 'swagger_helper'
require 'argument_view'

describe ArgumentView do
  it '#deprecated? returns false' 


  context "type splitter" do
    let(:view) { ArgumentView.new "arg [String]" }

    it "accepts no type" 


    it "parses type with no desc" 


    it "parses type and desc" 


    it "parses complex types" 

  end

  context "line parser" do
    let(:view) { ArgumentView.new "arg [String]" }

    it "raises on missing param name and missing type" 


    # This is probably not ideal — I'm just documenting existing behavior.
    it "does not raise on missing param name when type is present" 


    it "parses without desc" 


    it "parses without type or desc" 

  end

  context "with types, enums, description" do
    let(:view) { ArgumentView.new %{arg [Optional, String, "val1"|"val2"] argument} }

    it "has enums" 


    it "has types" 


    it "has a description" 

  end

  context "with optional arg" do
    let(:view) { ArgumentView.new %{arg [String]} }

    it "is optional" 

  end

  context "with required arg" do
    let(:view) { ArgumentView.new %{arg [Required, String]} }

    it "is required" 

  end

  describe '#to_swagger' do
    let(:view) { ArgumentView.new("foo [String]") }

    it 'includes a "deprecated" key' 


    it 'returns false for "deprecated"' 

  end

  context 'Deprecated ArgumentView' do
    let(:valid_text) { "foo [Boolean] NOTICE 2018-01-02 EFFECTIVE 2018-04-30\nA description \non multiple lines." }
    let(:view) { ArgumentView.new(valid_text, deprecated: true) }

    it '#deprecated? returns true' 


    it '#to_swagger returns true for "deprecated"' 


    describe '#parse_line' do
      it 'parses the argument name' 


      it 'parses the argument type' 


      it 'parses the description' 


      it 'parses the effective deprecation date' 


      it 'parses the deprecation notice date' 


      it 'parses the effective deprecation date when it comes before the notice date' 


      it 'parses the deprecation notice date when it comes after the effective date' 


      # This is probably not ideal — I'm just documenting existing behavior.
      it 'uses the argument type as the name if name is not provided' 


      context 'when a type is not provided' do
        let(:text) { valid_text.gsub('[Boolean] ', '') }
        let(:view) { ArgumentView.new(text, deprecated: true) }

        it 'parses the argument name' 


        it 'uses String as the default type' 


        it 'parses the description' 


        it 'sets the effective deprecation date' 


        it 'sets the deprecation notice date' 

      end

      context 'validations' do
        it 'is invalid when the text "NOTICE" is omitted' 


        it 'is invalid when the NOTICE date is omitted' 


        it 'is invalid when the text "NOTICE" and the NOTICE date are omitted' 


        it 'is invalid when the NOTICE date is not in YYYY-MM-DD format' 


        it 'is invalid when the text "EFFECTIVE" is omitted' 


        it 'is invalid when the EFFECTIVE date is omitted' 


        it 'is invalid when the text "EFFECTIVE" and the EFFECTIVE date are omitted' 


        it 'is invalid when the EFFECTIVE date is not in YYYY-MM-DD format' 


        it 'is invalid when the EFFECTIVE date is < 90 days after the NOTICE date' 


        it 'is invalid when a description is not provided' 


        it 'is invalid when the description is on the same line as the other content' 

      end
    end
  end
end

