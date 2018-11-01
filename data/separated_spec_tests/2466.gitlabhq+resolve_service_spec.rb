require 'spec_helper'

describe MergeRequests::Conflicts::ResolveService do
  include ProjectForksHelper
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :repository) }

  let(:forked_project) do
    fork_project_with_submodules(project, user)
  end

  let(:merge_request) do
    create(:merge_request,
           source_branch: 'conflict-resolvable', source_project: project,
           target_branch: 'conflict-start')
  end

  let(:merge_request_from_fork) do
    create(:merge_request,
           source_branch: 'conflict-resolvable-fork', source_project: forked_project,
           target_branch: 'conflict-start', target_project: project)
  end

  describe '#execute' do
    let(:service) { described_class.new(merge_request) }

    def blob_content(project, ref, path)
      project.repository.blob_at(ref, path).data
    end

    context 'with section params' do
      let(:params) do
        {
          files: [
            {
              old_path: 'files/ruby/popen.rb',
              new_path: 'files/ruby/popen.rb',
              sections: {
                '2f6fcd96b88b36ce98c38da085c795a27d92a3dd_14_14' => 'head'
              }
            }, {
              old_path: 'files/ruby/regex.rb',
              new_path: 'files/ruby/regex.rb',
              sections: {
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head',
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_21_21' => 'origin',
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_49_49' => 'origin'
              }
            }
          ],
          commit_message: 'This is a commit message!'
        }
      end

      context 'when the source and target project are the same' do
        before do
          service.execute(user, params)
        end

        it 'creates a commit with the message' 


        it 'creates a commit with the correct parents' 

      end

      context 'when some files have trailing newlines' do
        let!(:source_head) do
          branch = 'conflict-resolvable'
          path = 'files/ruby/popen.rb'
          popen_content = blob_content(project, branch, path)

          project.repository.update_file(
            user,
            path,
            popen_content.chomp("\n"),
            message: 'Remove trailing newline from popen.rb',
            branch_name: branch
          )
        end

        before do
          service.execute(user, params)
        end

        it 'preserves trailing newlines from our side of the conflicts' 

      end

      context 'when the source project is a fork and does not contain the HEAD of the target branch' do
        let!(:target_head) do
          project.repository.create_file(
            user,
            'new-file-in-target',
            '',
            message: 'Add new file in target',
            branch_name: 'conflict-start')
        end

        subject do
          described_class.new(merge_request_from_fork).execute(user, params)
        end

        it 'creates a commit with the message' 


        it 'creates a commit with the correct parents' 

      end
    end

    context 'with content and sections params' do
      let(:popen_content) { "class Popen\nend" }

      let(:params) do
        {
          files: [
            {
              old_path: 'files/ruby/popen.rb',
              new_path: 'files/ruby/popen.rb',
              content: popen_content
            }, {
              old_path: 'files/ruby/regex.rb',
              new_path: 'files/ruby/regex.rb',
              sections: {
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head',
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_21_21' => 'origin',
                '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_49_49' => 'origin'
              }
            }
          ],
          commit_message: 'This is a commit message!'
        }
      end

      before do
        service.execute(user, params)
      end

      it 'creates a commit with the message' 


      it 'creates a commit with the correct parents' 


      it 'sets the content to the content given' 

    end

    context 'when a resolution section is missing' do
      let(:invalid_params) do
        {
          files: [
            {
              old_path: 'files/ruby/popen.rb',
              new_path: 'files/ruby/popen.rb',
              content: ''
            }, {
              old_path: 'files/ruby/regex.rb',
              new_path: 'files/ruby/regex.rb',
              sections: { '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head' }
            }
          ],
          commit_message: 'This is a commit message!'
        }
      end

      it 'raises a ResolutionError error' 

    end

    context 'when the content of a file is unchanged' do
      let(:resolver) do
        MergeRequests::Conflicts::ListService.new(merge_request).conflicts.resolver
      end
      let(:regex_conflict) do
        resolver.conflict_for_path(resolver.conflicts, 'files/ruby/regex.rb', 'files/ruby/regex.rb')
      end

      let(:invalid_params) do
        {
          files: [
            {
              old_path: 'files/ruby/popen.rb',
              new_path: 'files/ruby/popen.rb',
              content: ''
            }, {
              old_path: 'files/ruby/regex.rb',
              new_path: 'files/ruby/regex.rb',
              content: regex_conflict.content
            }
          ],
          commit_message: 'This is a commit message!'
        }
      end

      it 'raises a ResolutionError error' 

    end

    context 'when a file is missing' do
      let(:invalid_params) do
        {
          files: [
            {
              old_path: 'files/ruby/popen.rb',
              new_path: 'files/ruby/popen.rb',
              content: ''
            }
          ],
          commit_message: 'This is a commit message!'
        }
      end

      it 'raises a ResolutionError error' 

    end
  end
end

