#
# Copyright (C) 2015 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe Api::Html::Content, type: :request do
  describe "apply_mathml" do
    context "valid latex" do
      before do
        @latex = '\frac{a}{b}'
        @node = Nokogiri::HTML::DocumentFragment.parse("<img alt='#{@latex}' />").children.first
      end

      it "retains the alt attribute" 


      it "sets data-mathml" 

    end

    context "invalid latex" do
      before do
        @latex = '\frac{a}{' # incomplete
        @node = Nokogiri::HTML::DocumentFragment.parse("<img alt='#{@latex}' />").children.first
      end

      it "handles error gracefully" 


      it "retains the alt attribute" 


      it "doesn't set data-mathml" 

    end
  end
end

