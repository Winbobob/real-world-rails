require 'spec_helper'

feature 'File blob', :js do
  include MobileHelpers

  let(:project) { create(:project, :public, :repository) }

  def visit_blob(path, anchor: nil, ref: 'master')
    visit project_blob_path(project, File.join(ref, path), anchor: anchor)

    wait_for_requests
  end

  context 'Ruby file' do
    before do
      visit_blob('files/ruby/popen.rb')
    end

    it 'displays the blob' 


    it 'displays file actions on all screen sizes' 

  end

  context 'Markdown file' do
    context 'visiting directly' do
      before do
        visit_blob('files/markdown/ruby-style-guide.md')
      end

      it 'displays the blob using the rich viewer' 


      context 'switching to the simple viewer' do
        before do
          find('.js-blob-viewer-switch-btn[data-viewer=simple]').click

          wait_for_requests
        end

        it 'displays the blob using the simple viewer' 


        context 'switching to the rich viewer again' do
          before do
            find('.js-blob-viewer-switch-btn[data-viewer=rich]').click

            wait_for_requests
          end

          it 'displays the blob using the rich viewer' 

        end
      end
    end

    context 'visiting with a line number anchor' do
      before do
        visit_blob('files/markdown/ruby-style-guide.md', anchor: 'L1')
      end

      it 'displays the blob using the simple viewer' 

    end
  end

  context 'Markdown file (stored in LFS)' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add Markdown in LFS",
        file_path: 'files/lfs/file.md',
        file_content: project.repository.blob_at('master', 'files/lfs/lfs_object.iso').data
      ).execute
    end

    context 'when LFS is enabled on the project' do
      before do
        allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)
        project.update_attribute(:lfs_enabled, true)

        visit_blob('files/lfs/file.md')
      end

      it 'displays an error' 


      context 'switching to the simple viewer' do
        before do
          find('.js-blob-viewer-switcher .js-blob-viewer-switch-btn[data-viewer=simple]').click

          wait_for_requests
        end

        it 'displays an error' 

      end
    end

    context 'when LFS is disabled on the project' do
      before do
        visit_blob('files/lfs/file.md')
      end

      it 'displays the blob' 

    end
  end

  context 'PDF file' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add PDF",
        file_path: 'files/test.pdf',
        file_content: project.repository.blob_at('add-pdf-file', 'files/pdf/test.pdf').data
      ).execute

      visit_blob('files/test.pdf')
    end

    it 'displays the blob' 

  end

  context 'ISO file (stored in LFS)' do
    context 'when LFS is enabled on the project' do
      before do
        allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)
        project.update_attribute(:lfs_enabled, true)

        visit_blob('files/lfs/lfs_object.iso')
      end

      it 'displays the blob' 

    end

    context 'when LFS is disabled on the project' do
      before do
        visit_blob('files/lfs/lfs_object.iso')
      end

      it 'displays the blob' 

    end
  end

  context 'ZIP file' do
    before do
      visit_blob('Gemfile.zip')
    end

    it 'displays the blob' 

  end

  context 'empty file' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add empty file",
        file_path: 'files/empty.md',
        file_content: ''
      ).execute

      visit_blob('files/empty.md')
    end

    it 'displays an error' 

  end

  context 'binary file that appears to be text in the first 1024 bytes' do
    before do
      visit_blob('encoding/binary-1.bin', ref: 'binary-encoding')
    end

    it 'displays the blob' 

  end

  context '.gitlab-ci.yml' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add .gitlab-ci.yml",
        file_path: '.gitlab-ci.yml',
        file_content: File.read(Rails.root.join('spec/support/gitlab_stubs/gitlab_ci.yml'))
      ).execute

      visit_blob('.gitlab-ci.yml')
    end

    it 'displays an auxiliary viewer' 

  end

  context '.gitlab/route-map.yml' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add .gitlab/route-map.yml",
        file_path: '.gitlab/route-map.yml',
        file_content: <<-MAP.strip_heredoc
          # Team data
          - source: 'data/team.yml'
            public: 'team/'
        MAP
      ).execute

      visit_blob('.gitlab/route-map.yml')
    end

    it 'displays an auxiliary viewer' 

  end

  context 'LICENSE' do
    before do
      visit_blob('LICENSE')
    end

    it 'displays an auxiliary viewer' 

  end

  context '*.gemspec' do
    before do
      project.add_master(project.creator)

      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add activerecord.gemspec",
        file_path: 'activerecord.gemspec',
        file_content: <<-SPEC.strip_heredoc
          Gem::Specification.new do |s|
            s.platform    = Gem::Platform::RUBY
            s.name        = "activerecord"
          end
        SPEC
      ).execute

      visit_blob('activerecord.gemspec')
    end

    it 'displays an auxiliary viewer' 

  end

  context 'realtime pipelines' do
    before do
      Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'feature',
        branch_name: 'feature',
        commit_message: "Add ruby file",
        file_path: 'files/ruby/test.rb',
        file_content: "# Awesome content"
      ).execute

      create(:ci_pipeline, status: 'running', project: project, ref: 'feature', sha: project.commit('feature').sha)
      visit_blob('files/ruby/test.rb', ref: 'feature')
    end

    it 'should show the realtime pipeline status' 

  end
end

