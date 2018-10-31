# frozen_string_literal: true

module QA
  context 'Plan', :smoke do
    describe 'Issue creation' do
      let(:issue_title) { 'issue title' }

      def create_issue
        Runtime::Browser.visit(:gitlab, Page::Main::Login)
        Page::Main::Login.act { sign_in_using_credentials }

        Factory::Resource::Issue.fabricate! do |issue|
          issue.title = issue_title
        end
      end

      it 'user creates an issue' 


      context 'when using attachments in comments', :object_storage do
        let(:file_to_attach) do
          File.absolute_path(File.join('spec', 'fixtures', 'banana_sample.gif'))
        end

        it 'user comments on an issue with an attachment' 

      end
    end
  end
end

