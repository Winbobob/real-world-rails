#
# Copyright (C) 2018 - present Instructure, Inc.
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
require_relative '../../spec_helper'
require_relative 'swagger_helper'
require 'deprecated_method_view'

describe DeprecatedMethodView do
  let(:valid_text) { "foo [Boolean] NOTICE 2018-01-02 EFFECTIVE 2018-04-30\nA description \non multiple lines." }

  it 'parses the effective deprecation date' 


  it 'parses the deprecation notice date' 


  it 'parses the description' 


  it 'parses the effective deprecation date when it comes before the notice date' 


  it 'parses the deprecation notice date when it comes after the effective date' 


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

