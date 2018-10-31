require 'rails_helper'

RSpec.describe Admin::EmailTemplatesController do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  def original_text(key)
    I18n.overrides_disabled { I18n.t(key) }
  end

  let(:original_subject) { original_text('user_notifications.admin_login.subject_template') }
  let(:original_body) { original_text('user_notifications.admin_login.text_body_template') }
  let(:headers) { { ACCEPT: 'application/json' } }

  after do
    TranslationOverride.delete_all
    I18n.reload!
  end

  context "#index" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 


    it "should work if you are an admin" 

  end

  context "#update" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 


    context "when logged in as admin" do
      before do
        sign_in(admin)
      end

      it "returns 'not found' when an unknown email template id is used" 


      shared_examples "invalid email template" do
        it "returns the right error messages" 


        it "doesn't create translation overrides" 


        it "doesn't create entries in the Staff Log" 

      end

      context "when subject is invalid" do
        let(:email_subject) { '%{email_wrongfix} Foo' }
        let(:email_body) { 'Body with missing interpolation keys' }

        let(:expected_errors) do
          [
            "<b>Subject</b>: #{I18n.t(
              'activerecord.errors.models.translation_overrides.attributes.value.invalid_interpolation_keys',
              keys: 'email_wrongfix'
            )}"
          ]
        end

        include_examples "invalid email template"
      end

      context "when body is invalid" do
        let(:email_subject) { 'Subject with missing interpolation key' }
        let(:email_body) { 'Body with %{invalid} interpolation key' }

        let(:expected_errors) do
          [
            "<b>Body</b>: #{I18n.t(
              'activerecord.errors.models.translation_overrides.attributes.value.invalid_interpolation_keys',
              keys: 'invalid'
            )}"
          ]
        end

        include_examples "invalid email template"
      end

      context "when subject and body are invalid invalid" do
        let(:email_subject) { 'Subject with %{invalid} interpolation key' }
        let(:email_body) { 'Body with some invalid interpolation keys: %{invalid}' }

        let(:expected_errors) do
          [
            "<b>Subject</b>: #{I18n.t(
              'activerecord.errors.models.translation_overrides.attributes.value.invalid_interpolation_keys',
              keys: 'invalid'
            )}",
            "<b>Body</b>: #{I18n.t(
              'activerecord.errors.models.translation_overrides.attributes.value.invalid_interpolation_keys',
              keys: 'invalid'
            )}",
          ]
        end

        include_examples "invalid email template"
      end

      context "when subject and body contain all required interpolation keys" do
        let(:email_subject) { '%{email_prefix} Foo' }
        let(:email_body) { 'The body contains [%{site_name}](%{base_url}) and %{email_token}.' }

        it "returns the successfully updated email template" 


        it "creates translation overrides" 


        it "creates entries in the Staff Log" 

      end

    end

  end

  context "#revert" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 


    context "when logged in as admin" do
      before do
        sign_in(admin)
      end

      it "returns 'not found' when an unknown email template id is used" 


      context "when email template has translation overrides" do
        let(:email_subject) { '%{email_prefix} Foo' }
        let(:email_body) { 'The body contains [%{site_name}](%{base_url}) and %{email_token}.' }

        before do
          put '/admin/customize/email_templates/user_notifications.admin_login', params: {
            email_template: { subject: email_subject, body: email_body }
          }, headers: headers
        end

        it "restores the original subject and body" 


        it "returns the restored email template" 


        it "creates entries in the Staff Log" 

      end
    end

  end

  it "uses only existing email templates" 

end

