# frozen_string_literal: true

require 'rails_helper'

def create_course
  start_date = '2025-02-10'.to_date # a Monday
  create(:course,
         id: 10001,
         start: start_date,
         end: start_date + 2.months,
         timeline_start: start_date,
         timeline_end: start_date + 2.months,
         weekdays: '0101010',
         submitted: true)
  create(:week,
         id: 1,
         course_id: 10001)
  create(:block,
         id: 1,
         week_id: 1,
         kind: Block::KINDS['assignment'],
         title: 'Block Title',
         order: 0,
         gradeable_id: 1)
  create(:gradeable,
         id: 1,
         gradeable_item_id: 1,
         gradeable_item_type: 'block')
  create(:block,
         id: 2,
         week_id: 1,
         kind: Block::KINDS['in_class'],
         title: 'Another Title',
         order: 1)
end

describe 'timeline editing', type: :feature, js: true do
  let(:unassigned_module_name) { 'Editing Basics' }

  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)

    create_course
    login_as create(:admin)
    stub_oauth_edit
  end

  it 'lets users add a training to an assignment block' 


  it 'lets users delete a week' 


  it 'lets users delete a block' 


  it 'handles cases of "save all" after blocks have been deleted' 


  it 'lets users remove grading from a block' 


  it 'lets users add a block' 

end

