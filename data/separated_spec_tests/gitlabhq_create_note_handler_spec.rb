require 'spec_helper'

describe Gitlab::Email::Handler::CreateNoteHandler do
  include_context :email_shared_context
  it_behaves_like :reply_processing_shared_examples

  before do
    stub_incoming_email_setting(enabled: true, address: "reply+%{key}@appmail.adventuretime.ooo")
    stub_config_setting(host: 'localhost')
  end

  let(:email_raw) { fixture_file('emails/valid_reply.eml') }
  let(:project)   { create(:project, :public, :repository) }
  let(:user)      { create(:user) }
  let(:note)      { create(:diff_note_on_merge_request, project: project) }
  let(:noteable)  { note.noteable }

  let!(:sent_notification) do
    SentNotification.record_note(note, user.id, mail_key)
  end

  context "when the recipient address doesn't include a mail key" do
    let(:email_raw) { fixture_file('emails/valid_reply.eml').gsub(mail_key, "") }

    it "raises a UnknownIncomingEmail" 

  end

  context "when no sent notification for the mail key could be found" do
    let(:email_raw) { fixture_file('emails/wrong_mail_key.eml') }

    it "raises a SentNotificationNotFoundError" 

  end

  context "when the noteable could not be found" do
    before do
      noteable.destroy
    end

    it "raises a NoteableNotFoundError" 

  end

  context "when the note could not be saved" do
    before do
      allow_any_instance_of(Note).to receive(:persisted?).and_return(false)
    end

    it "raises an InvalidNoteError" 


    context 'because the note was update commands only' do
      let!(:email_raw) { fixture_file("emails/update_commands_only_reply.eml") }

      context 'and current user cannot update noteable' do
        it 'raises a CommandsOnlyNoteError' 

      end

      context 'and current user can update noteable' do
        before do
          project.add_developer(user)
        end

        it 'does not raise an error' 

      end
    end
  end

  context 'when the note contains quick actions' do
    let!(:email_raw) { fixture_file("emails/commands_in_reply.eml") }

    context 'and current user cannot update the noteable' do
      it 'only executes the commands that the user can perform' 

    end

    context 'and current user can update noteable' do
      before do
        project.add_developer(user)
      end

      it 'posts a note and updates the noteable' 

    end
  end

  context "when the reply is blank" do
    let!(:email_raw) { fixture_file("emails/no_content_reply.eml") }

    it "raises an EmptyEmailError" 

  end

  context "when everything is fine" do
    before do
      setup_attachment
    end

    it "creates a comment" 


    it "adds all attachments" 


    context 'when sub-addressing is not supported' do
      before do
        stub_incoming_email_setting(enabled: true, address: nil)
      end

      shared_examples 'an email that contains a mail key' do |header|
        it "fetches the mail key from the #{header} header and creates a comment" 

      end

      context 'mail key is in the References header' do
        let(:email_raw) { fixture_file('emails/reply_without_subaddressing_and_key_inside_references.eml') }

        it_behaves_like 'an email that contains a mail key', 'References'
      end

      context 'mail key is in the References header with a comma' do
        let(:email_raw) { fixture_file('emails/reply_without_subaddressing_and_key_inside_references_with_a_comma.eml') }

        it_behaves_like 'an email that contains a mail key', 'References'
      end
    end
  end
end

