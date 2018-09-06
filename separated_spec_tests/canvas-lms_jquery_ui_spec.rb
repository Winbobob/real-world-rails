# encoding: UTF-8
#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + "/common")

describe "jquery ui" do
  include_context "in-process server selenium tests"

  def active
    driver.switch_to.active_element
  end

  def shift_tab
    driver.action.key_down(:shift)
      .send_keys(:tab)
      .key_up(:shift)
      .perform
  end

  def create_simple_modal
    driver.execute_script(<<-JS)
      return $('<div><select /><input /></div>')
        .dialog()
        .find('select')
        .focus()
    JS
  end

  before (:each) do
    course_with_teacher_logged_in
    get "/"
  end

  it "should make dialogs modal by default" 


  it "should capture tabbing" 


  it "should capture shift-tabbing" 


  context "calendar widget" do
    it "should let you replace content by selecting and typing instead of appending" 

  end

  context "dialog titles" do

    # jquery ui doesn't escape dialog titles by default (even when inferred from
    # title attributes!). our modified ui.dialog does (and hopefully jquery.ui
    # will too in 1.9). to pass in an html title that you don't want escaped,
    # wrap it in a jquery object.
    #
    # see http://bugs.jqueryui.com/ticket/6016
    it "should html-escape inferred dialog titles" 


    it "should use a non-breaking space for empty titles" 


    it "should html-escape explicit string dialog titles" 


    it "should accept jquery object dialog titles" 

  end

  context 'admin-links' do
    before do
      driver.execute_script(<<-JS)
        $('<div class="al-selenium">\
            <a class="al-trigger btn" role="button" aria-haspopup="true" aria-owns="toolbar-1" href="#">\
              <i class="icon-settings"></i>\
              <i class="icon-mini-arrow-down"></i>\
              <span class="screenreader-only">Settings</span>\
            </a>\
            <ul id="toolbar-1" class="al-options" role="menu">\
              <li role="presentation">\
                <a href="#" class="icon-edit">Edit</a>\
              </li>\
            </ul>\
          </div>').appendTo($('#content')).find('.al-trigger').focus();
      JS
    end

    it "should open every time when pressing return" 

  end
end

