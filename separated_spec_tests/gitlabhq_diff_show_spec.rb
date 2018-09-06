require 'spec_helper'

feature 'Diff file viewer', :js do
  let(:project) { create(:project, :public, :repository) }

  def visit_commit(sha, anchor: nil)
    visit project_commit_path(project, sha, anchor: anchor)

    wait_for_requests
  end

  context 'Ruby file' do
    before do
      visit_commit('570e7b2abdd848b95f2f578043fc23bd6f6fd24d')
    end

    it 'shows highlighted Ruby code' 

  end

  context 'Ruby file (stored in LFS)' do
    before do
      project.add_master(project.creator)

      @commit_id = Files::CreateService.new(
        project,
        project.creator,
        start_branch: 'master',
        branch_name: 'master',
        commit_message: "Add Ruby file in LFS",
        file_path: 'files/lfs/ruby.rb',
        file_content: project.repository.blob_at('master', 'files/lfs/lfs_object.iso').data
      ).execute[:result]
    end

    context 'when LFS is enabled on the project' do
      before do
        allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)
        project.update_attribute(:lfs_enabled, true)

        visit_commit(@commit_id)
      end

      it 'shows an error message' 

    end

    context 'when LFS is disabled on the project' do
      before do
        visit_commit(@commit_id)
      end

      it 'displays the diff' 

    end
  end

  context 'Image file' do
    context 'Replaced' do
      before do
        visit_commit('2f63565e7aac07bcdadb654e253078b727143ec4')
      end

      it 'shows a rendered image' 


      it 'shows view replaced and view file links' 

    end

    context 'Added' do
      before do
        visit_commit('33f3729a45c02fc67d00adb1b8bca394b0e761d9')
      end

      it 'shows view file link' 

    end

    context 'Deleted' do
      before do
        visit_commit('7fd7a459706ee87be6f855fd98ce8c552b15529a')
      end

      it 'shows view file link' 

    end
  end

  context 'ISO file (stored in LFS)' do
    context 'when LFS is enabled on the project' do
      before do
        allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)
        project.update_attribute(:lfs_enabled, true)

        visit_commit('048721d90c449b244b7b4c53a9186b04330174ec')
      end

      it 'shows that file was added' 

    end

    context 'when LFS is disabled on the project' do
      before do
        visit_commit('048721d90c449b244b7b4c53a9186b04330174ec')
      end

      it 'displays the diff' 

    end
  end

  context 'ZIP file' do
    before do
      visit_commit('ae73cb07c9eeaf35924a10f713b364d32b2dd34f')
    end

    it 'shows that file was added' 

  end

  context 'renamed file' do
    before do
      visit_commit('6907208d755b60ebeacb2e9dfea74c92c3449a1f')
    end

    it 'shows the filename with diff highlight' 

  end

  context 'binary file that appears to be text in the first 1024 bytes' do
    before do
      # The file we're visiting is smaller than 10 KB and we want it collapsed
      # so we need to disable the size increase feature.
      stub_feature_flags(gitlab_git_diff_size_limit_increase: false)

      visit_commit('7b1cf4336b528e0f3d1d140ee50cafdbc703597c')
    end

    it 'shows the diff is collapsed' 


    context 'expanding the diff' do
      before do
        # We can't use `click_link` because the "link" doesn't have an `href`.
        find('a.click-to-expand').click

        wait_for_requests
      end

      it 'shows there is no preview' 

    end
  end
end

