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

require File.expand_path('../spec_helper', File.dirname( __FILE__ ))

describe I18n do
  describe '.bigeasy_locale' do
    it 'does explicit overrides' 


    it 'does underscore conversion' 

  end

  describe '.moment_locale' do
    it 'does explicit overrides' 


    it 'does lowercase conversion' 

  end

  describe '.fullcalendar_locale' do
    it 'does explicit overrides' 


    it 'does lowercase conversion' 

  end

  describe ".i18nliner_scope" do
    it "should be correct for model class and instances" 

  end

  describe "numbers" do
    it "formats count" 


    it "formats interpolated numbers" 


    it "does not format numbery strings" 


    it "does not mutate the options" 

  end

  describe ".n" do
    before do
      format = {
        delimiter: '_',
        separator: ',',
        precision: 3,
        format: '%n %'
      }
      allow(I18n).to receive(:translate).with(:'number.format', anything).and_return(format)
      allow(I18n).to receive(:translate).with(:'number.percentage.format', anything).and_return(format)
      allow(I18n).to receive(:translate).with(:'number.precision.format', anything).and_return(format)
    end

    context "without precision" do
      it "uses delimiter" 


      it "uses separator" 

    end

    context "with precision" do
      it "uses delimiter" 


      it "truncates overly precise input" 

    end

    context "percentage" do
      it "formats without precision" 


      it "formats with precision" 


      it "has a max precision of 5 by default" 

    end
  end
end

