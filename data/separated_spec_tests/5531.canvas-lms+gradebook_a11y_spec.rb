#
# Copyright (C) 2016 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; wthout even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>

require_relative '../../helpers/gradezilla_common'
require_relative '../../helpers/color_common'
require_relative '../pages/gradezilla_page'
require_relative '../pages/gradezilla_cells_page'

describe "Gradezilla" do
  include_context "in-process server selenium tests"
  include GradezillaCommon
  include ColorCommon

  let(:extra_setup) { }
  let(:students) { @course.students }

  before(:once) { gradebook_data_setup }

  before do
    Account.default.set_feature_flag!('new_gradebook', 'on')
    extra_setup
    user_session(@teacher)
  end

  context "export menu" do
    before do
      Gradezilla.visit(@course)
      Gradezilla.open_action_menu
    end

    it "moves focus to Actions menu trigger button during current export", priority: "2", test_id: 720459 do
      Gradezilla.action_menu_item_selector("export").click

      expect(current_active_element.tag_name).to eq('button')
      expect(current_active_element.text).to eq('Actions')
    end

    context "when a csv already exists" do
      let(:extra_setup) do
        attachment = @course.attachments.create!(uploaded_data: default_uploaded_data)
        progress = @course.progresses.new(tag: 'gradebook_export')
        progress.workflow_state = 'completed'
        progress.save!
        @course.gradebook_csvs.create!(user: @teacher,
                                       progress: progress,
                                       attachment: attachment)
      end

      it "maintains focus to Actions menu trigger during past csv export", priority: "2", test_id: 720460 do
        Gradezilla.select_previous_grade_export

        expect(current_active_element.tag_name).to eq('button')
        expect(current_active_element.text).to eq('Actions')
      end
    end
  end

  context "return focus to settings menu when it closes" do
    before { Gradezilla.visit(@course) }

    it "after arrange columns is clicked", priority: "2", test_id: 720462 do
      view_menu = Gradezilla.open_view_menu_and_arrange_by_menu
      Gradezilla.select_gradebook_menu_option('Due Date - Oldest to Newest')
      expect(check_element_has_focus(Gradezilla.view_options_menu_selector)).to be true
    end
  end

  context "return focus to view options menu when it closes" do

    before { Gradezilla.visit(@course) }

    it 'returns focus to the view options menu after clicking the "Notes" option' 

  end

  context "assignment header contrast" do
    let(:assignment_title) { @course.assignments.first.title }

    context "without high contrast mode" do
      before do
        @teacher.disable_feature!(:high_contrast)
        Gradezilla.visit(@course)
      end

      it 'meets 3:1 contrast for column headers' 

    end

    context "with high contrast mode" do
      before do
        @teacher.enable_feature!(:high_contrast)
        Gradezilla.visit(@course)
      end

      it 'meets 4.5:1 contrast for column headers' 

    end
  end

  context 'keyboard shortcut "c"' do
    before do
      Gradezilla.visit(@course)
    end

    it 'opens the submissions tray when a cell has focus and is not in edit mode' 


    it 'does not open the submission tray when a cell has focus and is in edit mode' 


    it 'does not open the submission tray when grid does not have focus' 

  end

  context 'keyboard shortcut "m"' do
    before do
      Gradezilla.visit(@course)
    end

    it 'opens the assignment header menu when a cell has focus and is not in edit mode' 


    it 'does not open the assignment header menu when a cell has focus and is in edit mode' 


    it 'pressing escape closes the assignment header menu' 


    it 'opens the assignment group header menu when a cell has focus and is not in edit mode' 


    it 'pressing escape closes the assignment group header menu' 


    it 'opens the total header menu when a cell has focus and is not in edit mode' 


    it 'pressing escape closes the total header menu' 


    it 'does not open a menu when grid does not have focus' 

  end

  context 'keyboard shortcut "s"' do
    before do
      Gradezilla.visit(@course)
    end

    # Default sort is by student name ascending, so first press of "s" will
    # toggle to descending sort
    it 'toggles sort order on student column by name' 


    it 'sorts assignment columns by score ascending' 


    it 'toggles sort on assignment columns' 


    it 'sorts assignment group columns by score ascending' 


    it 'toggles sort on assignment group columns' 


    it 'sorts total column by score ascending' 


    it 'toggles sort on total columns' 


    it 'sorts custom columns alphabetically' 


    it 'toggle sort on custom columns' 

  end

  context 'keyboard shortcut "g"' do
    before do
      Gradezilla.visit(@course)
    end

    it 'navigates to assignment details page if assignment cell is selected' 

  end

  context "assignment header focus" do
    before { Gradezilla.visit(@course)}
    let(:assignment) { @course.assignments.first }

    it 'is placed on assignment header trigger upon sort' 


    %w[message-students-who curve-grades set-default-grade assignment-muter download-submissions].each do |dialog|
      it "is placed on assignment header trigger upon #{dialog} dialog close" 

    end
  end
end

