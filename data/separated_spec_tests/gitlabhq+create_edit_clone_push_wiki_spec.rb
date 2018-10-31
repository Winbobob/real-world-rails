# frozen_string_literal: true

module QA
  context 'Create' do
    describe 'Wiki management' do
      def login
        Runtime::Browser.visit(:gitlab, Page::Main::Login)
        Page::Main::Login.act { sign_in_using_credentials }
      end

      def validate_content(content)
        expect(page).to have_content('Wiki was successfully updated')
        expect(page).to have_content(/#{content}/)
      end

      before do
        login
      end

      it 'user creates, edits, clones, and pushes to the wiki' 

    end
  end
end

