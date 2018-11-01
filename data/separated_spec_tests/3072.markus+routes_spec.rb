describe 'Routing to main page', type: :routing do
  context 'Locale-less root' do
    it 'routes / to login' 

  end

  context 'Root with locale' do
    it 'routes /en/ to error' 

  end
end

# start Admin route tests
context 'Admin resource' do
  let(:admin) { create(:admin) }
  let(:path) { '/en/admins' }
  let(:ctrl) { 'admins' }

  it 'routes GET index correctly' 


  it 'routes GET new correctly' 


  it 'routes POST create correctly' 


  it 'routes GET show correctly' 


  it 'routes GET edit correctly' 


  it 'routes PUT update correctly' 


  it 'routes DELETE destroy correctly' 

end
# end Admin route tests

# start Assignment route tests
describe 'An Assignment' do
  let(:assignment) { create(:assignment) }
  let(:path) { '/en/assignments' }
  let(:ctrl) { 'assignments' }

  # start Assignment collection route tests
  context 'collection' do
    it 'routes GET delete_rejected properly' 


    it 'routes POST update_collected_submissions' 

  end
  # end Assignment collection route tests

  # start Assignment member route tests
  context 'member' do
    it 'routs GET refresh_graph properly' 


    it 'routes GET student_interface properly' 

  end
  # end Assignment member route tests

  # start assignment criteria route tests
  context 's criteria' do
    context 'collection' do
      let(:criteria_path) { path + '/' + assignment.id.to_s + '/criteria' }
      let(:criteria_ctrl) { 'criteria' }

      it 'routes POST update_positions properly' 


      it 'routes GET show id: update_positions' 


      it 'routes GET download_yml properly' 


      it 'routes POST yml_upload properly' 

    end
  end
  # end assignment criteria route tests

  # start assignment automated_tests resource route tests
  context 's automated_tests' do
    let(:autom_path) { path + '/' + assignment.id.to_s + '/automated_tests' }
    let(:autom_ctrl) { 'automated_tests' }

    context 'collection' do
      it 'routes GET manage properly' 


      it 'routes POST update properly' 


      it 'routes POST update_positions properly' 


      it 'routes GET update_positions properly' 


      it 'routes POST upload properly' 


      it 'routes GET download properly' 

    end
  end
  # end assignment automated_tests resource route tests

  # start assignment group route tests
  context 'groups' do
    let(:group) { create(:group) }
    let(:group_path) { path + '/' + assignment.id.to_s + '/groups' }
    let(:group_ctrl) { 'groups' }

    context 'resource members' do
      it 'routes DELETE destroy properly' 


      it 'routes POST rename_group properly' 

    end

    context 'collection' do
      it 'routes POST create properly' 


      it 'routes PATCH accept_invitation properly' 


      it 'routes PATCH decline_invitation properly' 


      it 'routes POST invite_member properly' 


      it 'routes PATCH disinvite_member properly' 


      it 'routes DELETE delete_rejected properly' 


      it 'routes GET index properly' 


      it 'routes GET add_group properly' 


      it 'routes POST use_another_assignment_groups properly' 


      it 'routes GET manage properly' 


      it 'routes POST csv_upload properly' 


      it 'routes GET add_csv_group properly' 


      it 'routes GET download_grouplist properly' 


      it 'route GET create_groups_when_students_work_alone properly' 


      it 'routes GET valid_grouping properly' 


      it 'routes GET invalid_grouping properly' 


      it 'routes GET global_actions properly' 


      it 'routes GET rename_group properly' 


      it 'routes DELETE remove_group properly' 


      it 'routes POST add_group properly' 


      it 'routes POST global_actions properly' 

    end
  end
  # end assignment group route tests

  # start assignment submissions route tests
  context 'submission' do
    let(:submission) { create(:submission) }
    let(:sub_path) { path + '/' + assignment.id.to_s + '/submissions' }
    let(:sub_ctrl) { 'submissions' }

    context 'collection' do
      it 'routes GET file_manager properly' 


      it 'routes GET browse properly' 


      it 'routes GET populate_file_manager properly' 


      it 'routes GET download_repo_checkout_commands properly' 


      it 'routes GET download_repo_list properly' 


      it 'routes GET populate_submissions_table' 


      it 'routes GET populate_file_manager' 


      it 'routes GET updated_files properly' 


      it 'routes GET replace_files properly' 


      it 'routes GET delete_files properly' 


      it 'routes POST update_files properly' 


      it 'routes POST update_submissions properly' 


      it 'routes GET server_time properly' 


      it 'routes GET download properly' 

    end

    context 'member' do
      it 'routes GET collect_and_begin_grading properly' 


      it 'routes POST manually_collect_and_begin_grading properly' 


      it 'routes GET repo_browser properly' 

    end

    context 'results' do
      let(:res_path) { sub_path + '/' + submission.id.to_s + '/results' }
      let(:res_ctrl) { 'results' }

      context 'collection' do
        it 'routes GET update_mark properly' 


        it 'routes GET expand_criteria properly' 


        it 'routes GET collapse_criteria properly' 


        it 'routes GET expand_unmarked_criteria properly' 


        it 'routes GET edit properly' 


        it 'routes GET download properly' 

      end

      context 'member' do
        it 'routes GET add_extra_marks properly' 


        it 'routes GET add_extra_mark properly' 


        it 'routes GET download properly' 


        it 'routes POST download properly' 


        it 'routes DELETE cancel_remark_request properly' 


        it 'routes POST add_extra_mark properly' 


        it 'routes GET next_grouping properly' 


        it 'routes POST remove_extra_mark properly' 


        it 'routes POST set_released_to_students properly' 


        it 'routes POST update_overall_comment properly' 


        it 'routes POST toggle_marking_state properly' 


        it 'routes PATCH update_remark_request properly' 


        it 'routes GET update_positions properly' 


        it 'routes GET view_marks properly' 

      end
    end
  end
  # end assignment submissions route tests

  context 'grader' do
    let(:grader_path) { path + '/' + assignment.id.to_s + '/graders' }
    let(:grader_ctrl) { 'graders' }

    context 'collection' do
      it 'routes POST csv_upload_grader_groups_mapping properly' 


      it 'routes POST csv_upload_grader_criteria_mapping properly' 


      it 'routes GET download_grader_groupings_mapping properly' 


      it 'routes GET download_grader_criteria_mapping properly' 


      it 'routes GET download_dialog properly' 


      it 'routes GET download_grouplist properly' 


      it 'routes GET global_actions properly' 


      it 'routes POST set_assign_criteria properly' 


      it 'routes GET upload_dialog properly' 


      it 'routes POST global_actions properly' 

    end
  end
  # end assignment graders route tests

  context 'annotation_categories' do
    let(:annot_path) do
      path + '/' + assignment.id.to_s +
        '/annotation_categories'
    end
    let(:annot_ctrl) { 'annotation_categories' }

    context 'members' do
      let(:id) { '1' }
      it 'routes GET properly' 


      it 'routes DELETE properly' 


      it 'routes PUT properly' 


      it 'routes DELETE delete_annotation_text properly' 


      it 'routes GET add_annotation_text properly' 


      it 'routes POST add_annotation_text properly' 


      it 'routes PUT update_annotation properly' 

    end

    context 'collection' do
      it 'routes GET new properly' 


      it 'routes POST properly' 


      it 'routes GET properly' 


      it 'routes POST csv_upload properly' 


      it 'routes GET download properly' 


      it 'routes POST yml_upload properly' 


      it 'routes GET add_annotation_text properly' 


      it 'routes POST delete_annotation_text properly' 


      it 'routes POST update_annotation properly' 

    end
  end
end
# end assignment route tests

# start grade entry forms route tests
context 'grade_entry_forms' do
  let(:grade_entry_form) { create(:grade_entry_form) }
  let(:path) { '/en/grade_entry_forms' }
  let(:ctrl) { 'grade_entry_forms' }

  context 'collection' do
    it 'routes GET student_interface properly' 

  end
  # end grade_entry_forms collection route tests

  context 'member' do
    it 'routes GET grades properly' 


    it 'routes GET csv_download properly' 


    it 'routes POST csv_upload properly' 


    it 'routes POST update_grade properly' 


    it 'routes POST update_grade_entry_students properly' 


    it 'routes GET student_interface properly' 

  end
end
# end grade_entry_forms route tests

# start notes route tests
context 'notes' do
  let(:path) { '/en/notes' }
  let(:ctrl) { 'notes' }

  context 'collection' do
    it 'routes POST add_note properly' 


    it 'routes POST noteable_object_selector properly' 


    it 'routes GET new_update_groupings properly' 


    it 'routes POST new_update_groupings properly' 

  end
  # end notes collection route tests

  context 'member' do
    it 'routes GET student_interface properly' 


    it 'routes GET notes_dialog properly' 


    it 'routes POST grades properly' 

  end
  # end notes member route tests
end
# end notes route tests

# start annotation collection route tests
context 'annotation collection' do
  let(:path) { '/en/annotations' }
  let(:ctrl) { 'annotations' }

  it 'routes POST add_existing_annotation properly' 


  it 'routes PUT update_annotation properly' 


  it 'routes DELETE destroy properly' 

end
# end annotation route tests

# start student collection route tests
context 'students collection' do
  let(:path) { '/en/students' }
  let(:ctrl) { 'students' }

  it 'routes PATCH bulk_modify properly' 


  it 'routes GET manage properly' 


  it 'routes GET add_new_section properly' 


  it 'routes GET download_student_list properly' 


  it 'routes POST upload_student_list properly' 

end
# end students collection route tests

# start tas collection route tests
context 'tas collection' do
  let(:path) { '/en/tas' }
  let(:ctrl) { 'tas' }

  it 'routes POST upload_ta_list properly' 


  it 'routes GET download_ta_list properly' 

end
# end tas collection route tests

# start main route tests
context 'main' do
  let(:path) { '/en/main' }
  let(:ctrl) { 'main' }

  context 'collection' do
    it 'routes GET logout properly' 


    it 'routes GET about properly' 


    it 'routes POST login_as properly' 


    it 'routes GET role_switch properly' 


    it 'routes GET clear_role_switch_session properly' 


    it 'routes POST reset_api_key properly' 

  end
  # end main collection route tests
  it 'routes GET index properly' 


  it 'routes GET about properly' 


  it 'routes GET logout properly' 

end
# end main route tests

