require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  before do
    @owner = Factory.create(:user)
    @project = Factory.create(:project, :user => @owner)
    @task_list = Factory.create(:task_list, :project => @project)
  end

  describe 'js_id' do
    it 'js_id(:edit_header,@project,@tasklist) => project_21_task_list_12_edit_header' 

    it 'js_id(:new_header,@project,TaskList.new) => project_21_task_list_new_header' 

    it 'js_id(nil,@project,TaskList.new) => project_21_task_list' 

  end

end

