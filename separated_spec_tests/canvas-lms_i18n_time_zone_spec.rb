# encoding: UTF-8
#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe I18nTimeZone do
  context "::all" do
    it "should provide an array of i18n tz instances" 

  end

  context "#keyify" do
    it "should provide a translation key for valid time zone name" 

  end

  context "localization" do
    before { I18n.locale = I18n.default_locale }
    after  { I18n.locale = I18n.default_locale }

    it "should present a localized name with offset when responding to #to_s" 

  end
end

