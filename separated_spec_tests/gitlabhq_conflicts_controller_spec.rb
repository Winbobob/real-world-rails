require 'spec_helper'

describe Projects::MergeRequests::ConflictsController do
  let(:project) { create(:project, :repository) }
  let(:user)    { project.owner }
  let(:merge_request) { create(:merge_request_with_diffs, target_project: project, source_project: project) }
  let(:merge_request_with_conflicts) do
    create(:merge_request, source_branch: 'conflict-resolvable', target_branch: 'conflict-start', source_project: project) do |mr|
      mr.mark_as_unmergeable
    end
  end

  before do
    sign_in(user)
  end

  describe 'GET show' do
    context 'when the conflicts cannot be resolved in the UI' do
      before do
        allow(Gitlab::Git::Conflict::Parser).to receive(:parse)
          .and_raise(Gitlab::Git::Conflict::Parser::UnmergeableFile)

        get :show,
            namespace_id: merge_request_with_conflicts.project.namespace.to_param,
            project_id: merge_request_with_conflicts.project,
            id: merge_request_with_conflicts.iid,
            format: 'json'
      end

      it 'returns a 200 status code' 


      it 'returns JSON with a message' 

    end

    context 'with valid conflicts' do
      before do
        get :show,
            namespace_id: merge_request_with_conflicts.project.namespace.to_param,
            project_id: merge_request_with_conflicts.project,
            id: merge_request_with_conflicts.iid,
            format: 'json'
      end

      it 'matches the schema' 


      it 'includes meta info about the MR' 


      it 'includes each file that has conflicts' 


      it 'splits files into sections with lines' 


      it 'has unique section IDs across files' 

    end
  end

  describe 'GET conflict_for_path' do
    def conflict_for_path(path)
      get :conflict_for_path,
          namespace_id: merge_request_with_conflicts.project.namespace.to_param,
          project_id: merge_request_with_conflicts.project,
          id: merge_request_with_conflicts.iid,
          old_path: path,
          new_path: path,
          format: 'json'
    end

    context 'when the conflicts cannot be resolved in the UI' do
      before do
        allow(Gitlab::Git::Conflict::Parser).to receive(:parse)
          .and_raise(Gitlab::Git::Conflict::Parser::UnmergeableFile)

        conflict_for_path('files/ruby/regex.rb')
      end

      it 'returns a 404 status code' 

    end

    context 'when the file does not exist cannot be resolved in the UI' do
      before do
        conflict_for_path('files/ruby/regexp.rb')
      end

      it 'returns a 404 status code' 

    end

    context 'with an existing file' do
      let(:path) { 'files/ruby/regex.rb' }

      before do
        conflict_for_path(path)
      end

      it 'returns a 200 status code' 


      it 'returns the file in JSON format' 

    end
  end

  context 'POST resolve_conflicts' do
    let!(:original_head_sha) { merge_request_with_conflicts.diff_head_sha }

    def resolve_conflicts(files)
      post :resolve_conflicts,
           namespace_id: merge_request_with_conflicts.project.namespace.to_param,
           project_id: merge_request_with_conflicts.project,
           id: merge_request_with_conflicts.iid,
           format: 'json',
           files: files,
           commit_message: 'Commit message'
    end

    context 'with valid params' do
      before do
        resolved_files = [
          {
            'new_path' => 'files/ruby/popen.rb',
            'old_path' => 'files/ruby/popen.rb',
            'sections' => {
              '2f6fcd96b88b36ce98c38da085c795a27d92a3dd_14_14' => 'head'
            }
          }, {
            'new_path' => 'files/ruby/regex.rb',
            'old_path' => 'files/ruby/regex.rb',
            'sections' => {
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_21_21' => 'origin',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_49_49' => 'origin'
            }
          }
        ]

        resolve_conflicts(resolved_files)
      end

      it 'creates a new commit on the branch' 


      it 'returns an OK response' 

    end

    context 'when sections are missing' do
      before do
        resolved_files = [
          {
            'new_path' => 'files/ruby/popen.rb',
            'old_path' => 'files/ruby/popen.rb',
            'sections' => {
              '2f6fcd96b88b36ce98c38da085c795a27d92a3dd_14_14' => 'head'
            }
          }, {
            'new_path' => 'files/ruby/regex.rb',
            'old_path' => 'files/ruby/regex.rb',
            'sections' => {
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head'
            }
          }
        ]

        resolve_conflicts(resolved_files)
      end

      it 'returns a 400 error' 


      it 'has a message with the name of the first missing section' 


      it 'does not create a new commit' 

    end

    context 'when files are missing' do
      before do
        resolved_files = [
          {
            'new_path' => 'files/ruby/regex.rb',
            'old_path' => 'files/ruby/regex.rb',
            'sections' => {
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_21_21' => 'origin',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_49_49' => 'origin'
            }
          }
        ]

        resolve_conflicts(resolved_files)
      end

      it 'returns a 400 error' 


      it 'has a message with the name of the missing file' 


      it 'does not create a new commit' 

    end

    context 'when a file has identical content to the conflict' do
      before do
        content = MergeRequests::Conflicts::ListService.new(merge_request_with_conflicts)
                    .file_for_path('files/ruby/popen.rb', 'files/ruby/popen.rb')
                    .content

        resolved_files = [
          {
            'new_path' => 'files/ruby/popen.rb',
            'old_path' => 'files/ruby/popen.rb',
            'content' => content
          }, {
            'new_path' => 'files/ruby/regex.rb',
            'old_path' => 'files/ruby/regex.rb',
            'sections' => {
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_9_9' => 'head',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_21_21' => 'origin',
              '6eb14e00385d2fb284765eb1cd8d420d33d63fc9_49_49' => 'origin'
            }
          }
        ]

        resolve_conflicts(resolved_files)
      end

      it 'returns a 400 error' 


      it 'has a message with the path of the problem file' 


      it 'does not create a new commit' 

    end
  end
end

