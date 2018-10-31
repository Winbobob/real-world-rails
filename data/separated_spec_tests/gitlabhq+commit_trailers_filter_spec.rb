require 'spec_helper'
require 'ffaker'

describe Banzai::Filter::CommitTrailersFilter do
  include FilterSpecHelper
  include CommitTrailersSpecHelper

  let(:secondary_email)     { create(:email, :confirmed) }
  let(:user)                { create(:user) }

  let(:trailer)             { "#{FFaker::Lorem.word}-by:"}

  let(:commit_message)      { trailer_line(trailer, user.name, user.email) }
  let(:commit_message_html) { commit_html(commit_message) }

  context 'detects' do
    let(:email) { FFaker::Internet.email }

    it 'trailers in the form of *-by and replace users with links' 


    it 'trailers prefixed with whitespaces' 


    it 'GitLab users via a secondary email' 


    context 'non GitLab users' do
      shared_examples 'mailto links' do
        it 'replaces them with mailto links' 

      end

      context 'when Gravatar is disabled' do
        before do
          stub_application_setting(gravatar_enabled: false)
        end

        it_behaves_like 'mailto links'
      end

      context 'when Gravatar is enabled' do
        before do
          stub_application_setting(gravatar_enabled: true)
        end

        it_behaves_like 'mailto links'
      end
    end

    it 'multiple trailers in the same message' 


    context 'special names' do
      where(:name) do
        [
          'John S. Doe',
          'L33t H@x0r'
        ]
      end

      with_them do
        it do
          message, message_html = build_commit_message(
            trailer: trailer,
            name: name,
            email: email
          )

          doc = filter(message_html)

          expect_to_have_mailto_link_with_avatar(doc, email: email, trailer: trailer)
          expect(doc.text).to match Regexp.escape(message)
        end
      end
    end
  end

  context "ignores" do
    it 'commit messages without trailers' 


    it 'trailers that are inline the commit message body' 

  end

  context "structure" do
    it 'preserves the commit trailer structure' 


    it 'preserves the original name used in the commit message' 


    it 'preserves the original email used in the commit message' 


    it 'only replaces trailer lines not the full commit message' 

  end
end

