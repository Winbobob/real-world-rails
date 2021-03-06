#
# Copyright (C) 2015 - present Instructure, Inc.
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

require_relative '../../helpers/gradebook_common'

describe "gradebook - total points toggle" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  before(:once) { gradebook_data_setup }
  before(:each) { user_session(@teacher) }
  after(:each) { clear_local_storage }

  def should_show_percentages
    ff(".slick-row .slick-cell:nth-child(5)").each { |total| expect(total.text).to match(/%/) }
  end

  def should_show_points(*expected_points)
    ff(".slick-row .slick-cell:nth-child(5)").each do |total|
      raise Error "Total text is missing." unless total.text
      total.text.strip!
      expect(total.text).to match(/\A#{expected_points.shift}$/) unless total.text.length < 1
    end
  end

  def open_display_dialog
    f("#total_dropdown").click
    f(".toggle_percent").click
  end

  def close_display_dialog
    f(".ui-icon-closethick").click
  end

  def toggle_grade_display
    open_display_dialog
    dialog = fj('.ui-dialog:visible')
    submit_dialog(dialog, '.ui-button')
  end

  def close_dialog_and_dont_show_again
    dialog = fj('.ui-dialog:visible')
    fj("#hide_warning").click
    submit_dialog(dialog, '.ui-button')
  end

  it "shows points when group weights are not set" 


  it "shows percentages when group weights are set", test_id: 164231, priority: "2" 


  it "should warn the teacher that studens will see a change" 


  it 'should allow toggling display by points or percent', priority: "1", test_id: 164012 do
    get "/courses/#{@course.id}/gradebook"
    wait_for_ajaximations
    should_show_percentages
    toggle_grade_display

    wait_for_ajax_requests
    should_show_points(15, 10, 10)

    toggle_grade_display
    wait_for_ajax_requests
    should_show_percentages
  end

  it 'should change the text on the toggle option when toggling' 


  it 'should not show the warning once dont show is checked' 

end

