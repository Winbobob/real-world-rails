# frozen_string_literal: true

require 'feature_spec_helper'

include Selectors::Dashboard

describe 'Generic File uploading and deletion:', type: :feature do
  let(:new_generic_work_path) { '/concern/generic_works/new' }

  context 'when logged in as a PSU user' do
    let(:current_user)          { create(:user) }
    let(:other_user)            { create(:user) }
    let(:filename)              { 'little_file.txt' }
    let(:batch)                 { ['little_file.txt', 'little_file.txt'] }
    let(:file)                  { work }
    let(:work)                  { find_work_by_title 'little_file.txt_title' }

    before { sign_in_with_named_js(:upload_and_delete, current_user, disable_animations: true) }

    describe "Sufia's default user agreement" do
      before { visit new_generic_work_path }
      it 'is not shown' 

    end

    describe 'uploading a new work' do
      before { visit new_generic_work_path }

      it 'enforces a workflow' 

    end

    context 'cloud providers' do
      before do
        allow(BrowseEverything).to receive(:config) { { 'dropbox' => { app_key: 'fakekey189274942347', app_secret: 'fakesecret489289472347298', max_upload_file_size: 20 * 1024 } } }
        allow(Sufia.config).to receive(:browse_everything) { { 'dropbox' => { app_key: 'fakekey189274942347', app_secret: 'fakesecret489289472347298' } } }
        allow_any_instance_of(BrowseEverything::Driver::Dropbox).to receive(:authorized?) { true }
        allow_any_instance_of(BrowseEverything::Driver::Dropbox).to receive(:token) { 'FakeDropboxAccessToken01234567890ABCDEF_AAAAAAA987654321' }
        allow_any_instance_of(GenericWork).to receive(:share_notified?).and_return(false)
        Sufia::AdminSetCreateService.create_default!
        visit(new_curation_concerns_generic_work_path)
        WebMock.enable!
      end

      after do
        WebMock.disable!
      end
      specify 'I can click on cloud providers' do
        expect(ShareNotifyJob).to receive(:perform_later)
        VCR.use_cassette('dropbox', record: :none) do
          click_link 'Files'
          expect(page).to have_content 'Add cloud files'
          click_on 'Add cloud files'
          expect(page).to have_css '#provider-select'
          select 'Dropbox', from: 'provider-select'
          sleep 10
          expect(page).to have_content 'Getting Started.pdf'
          click_on('Writer')
          expect(page).to have_content 'Writer FAQ.txt'
          expect(page).not_to have_css 'a', text: 'Writer FAQ.txt'
          expect(page).to have_content 'Markdown Test.txt'
          check('writer-markdown-test-txt')
          expect(page).to have_content '1 file selected'
          click_on('Submit')
          within 'tr.template-download' do
            expect(page).to have_content 'Markdown Test.txt'
          end
          within('#savewidget') do
            choose 'generic_work_visibility_authenticated'
          end
          sleep(1.second)
          check 'agreement'
          click_on 'Metadata'
          fill_in 'generic_work_title', with: 'Markdown Test'
          fill_in 'generic_work_keyword', with: 'keyword'
          fill_in 'generic_work[creators][0][given_name]', with: 'creator'
          select 'Attribution-NonCommercial-NoDerivatives 4.0 International', from: 'generic_work_rights'
          fill_in 'generic_work_description', with: 'My description'
          select 'Audio', from: 'generic_work_resource_type'
          sleep(1.second)
          click_on 'Save'
          expect(page).to have_content 'Your files are being processed'
          within('#activity_log') do
            expect(page).to have_content("User #{current_user.display_name} has deposited Markdown Test")
          end
          expect(page).to have_css('h1', 'Markdown Test')
          click_on 'Notifications'
          expect(page).to have_content 'The file (Markdown Test.txt) was successfully imported'
        end
      end
    end

    context 'user does not need help' do
      context 'with a single file' do
        let(:new_creator) { Agent.where(psu_id: 'jhc29').first }

        before do
          allow(ShareNotifyDeleteJob).to receive(:perform_later)
          Sufia::AdminSetCreateService.create_default!
        end

        it 'uploads the file, sends notification, creates new agent records, and deletes the file' 

      end
    end
  end

  context 'When logged in as a non-PSU user' do
    let(:current_user) { create(:non_psu_user) }

    before { sign_in_with_js(current_user) }

    specify 'I cannot access the upload page' do
      visit new_generic_work_path
      expect(page).to have_content 'Unauthorized'
      expect(page).not_to have_content 'Upload'
    end
  end
end

