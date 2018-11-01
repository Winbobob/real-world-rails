#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

module Redmine
  describe UnifiedDiff do
    before do
      @diff = Redmine::UnifiedDiff.new(<<-DIFF
--- old.js Thu May 11 14:24:58 2014
+++ new.js Thu May 11 14:25:02 2014
@@ -0,0 +1,1 @@
+<script>someMethod();</script>
@@ -1,2 +1,2 @@
-text text
+text modified
      DIFF
                                      )
    end

    it 'should have 1 modified file' 


    it 'should have 3 diff items' 


    it 'should parse the HTML entities correctly' 

  end
end

