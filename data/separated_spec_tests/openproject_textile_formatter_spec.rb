#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
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
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'legacy_spec_helper'

describe Redmine::WikiFormatting::Textile::Formatter do
  include Rails::Dom::Testing::Assertions

  before do
    @formatter = Redmine::WikiFormatting::Textile::Formatter
  end

  MODIFIERS = {
    '*' => 'strong', # bold
    '_' => 'em',     # italic
    '+' => 'ins',    # underline
    '-' => 'del',    # deleted
    '^' => 'sup',    # superscript
    '~' => 'sub'     # subscript
  }

  it 'should modifiers' 


  it 'should modifiers combination' 


  it 'should inline code' 


  it 'should escaping' 


  it 'should use of backslashes followed by numbers in headers' 


  it 'should double dashes should not strikethrough' 


  it 'should acronyms' 


  it 'should inline auto link' 


  it 'should ignore links inside macros' 


  it 'should blockquote' 


  it 'should table' 


  it 'should table with line breaks' 


  it 'should textile should not mangle brackets' 


  it 'should textile should escape image urls' 


  private

  def assert_html_output(to_test, expect_paragraph = true)
    to_test.each do |text, expected|
      assert_dom_equal((expect_paragraph ? "<p>#{expected}</p>" : expected), @formatter.new(text).to_html, "Formatting the following text failed:\n===\n#{text}\n===\n")
    end
  end

  def to_html(text)
    @formatter.new(text).to_html
  end
end

