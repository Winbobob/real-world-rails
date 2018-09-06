require 'spec_helper'

describe SubmissionsController do
  after(:each) do
    destroy_repos
  end

  describe 'A student working alone' do
    before(:each) do
      @group = create(:group)
      @assignment = create(:assignment,
                           allow_web_submits: true,
                           group_min: 1)
      @grouping = create(:grouping,
                         group: @group,
                         assignment: @assignment)
      @membership = create(:student_membership,
                           membership_status: 'inviter',
                           grouping: @grouping)
      @student = @membership.user
      request.env['HTTP_REFERER'] = 'back'
    end

    it 'should be able to add and access files' 


    it 'should be able to populate a file' 


    it 'should be able to access file manager page' 


    it 'should render with the assignment content layout' 


    # TODO figure out how to test this test into the one above
    # TODO Figure out how to remove fixture_file_upload
    it 'should be able to replace files' 


    it 'should be able to delete files' 


    # Repository Browser Tests
    # TODO:  TEST REPO BROWSER HERE
    it 'should not be able to use the repository browser' 


    # Stopping a curious student
    it 'should not be able download svn checkout commands' 


    it 'should not be able to download the svn repository list' 

  end

  describe 'A TA' do
    before(:each) do
      @group = create(:group)
      @assignment = create(:assignment,
                           allow_web_submits: true,
                           group_min: 1)
      @grouping = create(:grouping,
                         group: @group,
                         assignment: @assignment)
      @membership = create(:student_membership,
                           membership_status: 'inviter',
                           grouping: @grouping)
      @student = @membership.user

      @grouping1 = create(:grouping,
                          assignment: @assignment)
      @grouping1.group.access_repo do |repo|
        txn = repo.get_transaction('test')
        path = File.join(@assignment.repository_folder, 'file1_name')
        txn.add(path, 'file1 content', '')
        repo.commit(txn)

        # Generate submission
        Submission.generate_new_submission(Grouping.last,
                                           repo.get_latest_revision)
      end
      @ta_membership = create(:ta_membership,
                              grouping: @grouping)
    end
    it 'should be able to access the repository browser.' 


    it 'should render with the content layout' 


    it 'should be able to download the svn checkout commands' 


    it 'should be able to download the svn repository list' 

  end

  describe 'An administrator' do
    before(:each) do
      @group = create(:group)
      @assignment = create(:assignment,
                           allow_web_submits: true,
                           group_min: 1)
      @grouping = create(:grouping,
                         group: @group,
                         assignment: @assignment)
      @membership = create(:student_membership,
                           membership_status: 'inviter',
                           grouping: @grouping)
      @student = @membership.user
      @admin = create(:admin)
      @csv_options = {
        type: 'text/csv',
        disposition: 'attachment',
        filename: "#{@assignment.short_identifier}_simple_report.csv"
      }
    end

    it 'should be able to access the repository browser' 


    it 'should render with the content layout' 


    it 'should be able to download the svn checkout commands' 


    it 'should be able to download the svn repository list' 


    describe 'attempting to collect submissions' do
      before(:each) do
        @grouping.group.access_repo do |repo|
          txn = repo.get_transaction('test')
          path = File.join(@assignment.repository_folder, 'file1_name')
          txn.add(path, 'file1 content', '')
          repo.commit(txn)

          # Generate submission
          submission =
              Submission.generate_new_submission(@grouping,
                                                 repo.get_latest_revision)
          result = submission.get_latest_result
          result.marking_state = Result::MARKING_STATES[:complete]
          result.save
          submission.save
        end
      end

      it 'should be able to release submissions' 


      context 'of selected groupings' do
        it 'should get an error if no groupings are selected' 


        context 'with a section' do
          before(:each) do
            @section = create(:section, name: 's1')
            @student.section = @section
            @student.save
          end

          it 'should get an error if it is before the section due date' 


          it 'should succeed if it is after the section due date' 

        end

        context 'without a section' do
          before(:each) do
            @student.section = nil
            @student.save
          end

          it 'should get an error if it is before the global due date' 


          it 'should succeed if it is after the global due date' 

        end
      end
    end

    it 'download all files uploaded in a Zip file' 


    it 'not be able to download an empty revision' 


    it 'not be able to download the revision 0' 


    describe 'attempting to download groupings files' do
      before(:each) do
        @assignment = create(:assignment,
                             allow_web_submits: true,
                             group_min: 1)
        (1..3).to_a.each do |i|
          @grouping = create(:grouping,
                             assignment: @assignment)
          @student = create(:student)

          instance_variable_set(:"@student#{i}", @student)
          instance_variable_set(:"@grouping#{i}",
                                @grouping)
          @membership = create(:student_membership,
                               user: instance_variable_get(:"@student#{i}"),
                               membership_status: 'inviter',
                               grouping: instance_variable_get(
                                 :"@grouping#{i}"))
          submit_file(@assignment, instance_variable_get(:"@grouping#{i}"),
                      "file#{i}", "file#{i}'s content\n")
        end
      end

      it 'should be able to download all groups\' submissions' 

      it 'should - as Ta - be not able to download all groups\' submissions when unassigned' 

      it 'should - as Ta - be able to download all groups\' submissions when assigned' 

    end
  end

  describe 'An unauthenticated or unauthorized user' do
    it 'should not be able to download the svn checkout commands' 


    it 'should not be able to download the svn repository list' 

  end
end

private

def submit_file(assignment, grouping, filename = 'file', content = 'content')
  grouping.group.access_repo do |repo|
    txn = repo.get_transaction('test')
    path = File.join(assignment.repository_folder, filename)
    txn.add(path, content, '')
    repo.commit(txn)

    # Generate submission
    Submission.generate_new_submission(
      grouping, repo.get_latest_revision)
  end
end

