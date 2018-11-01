# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Email::Handler::CreateMergeRequestHandler do
  include_context :email_shared_context
  it_behaves_like :reply_processing_shared_examples

  before do
    stub_incoming_email_setting(enabled: true, address: "incoming+%{key}@appmail.adventuretime.ooo")
    stub_config_setting(host: 'localhost')
  end

  after do
    TestEnv.clean_test_path
  end

  let(:email_raw) { fixture_file('emails/valid_new_merge_request.eml') }
  let(:namespace) { create(:namespace, path: 'gitlabhq') }

  let!(:project)  { create(:project, :public, :repository, namespace: namespace, path: 'gitlabhq') }
  let!(:user) do
    create(
      :user,
      email: 'jake@adventuretime.ooo',
      incoming_email_token: 'auth_token'
    )
  end

  context "as a non-developer" do
    before do
      project.add_guest(user)
    end

    it "raises UserNotAuthorizedError if the user is not a member" 

  end

  context "as a developer" do
    before do
      project.add_developer(user)
    end

    context "when everything is fine" do
      it "creates a new merge request" 

    end

    context "something is wrong" do
      context "when the merge request could not be saved" do
        before do
          allow_any_instance_of(MergeRequest).to receive(:save).and_return(false)
        end

        it "raises an InvalidMergeRequestError" 

      end

      context "when we can't find the incoming_email_token" do
        let(:email_raw) { fixture_file("emails/wrong_incoming_email_token.eml") }

        it "raises an UserNotFoundError" 

      end

      context "when the subject is blank" do
        let(:email_raw) { fixture_file("emails/valid_new_merge_request_no_subject.eml") }

        it "raises an InvalidMergeRequestError" 

      end

      context "when the message body is blank" do
        let(:email_raw) { fixture_file("emails/valid_new_merge_request_no_description.eml") }

        it "creates a new merge request with description set from the last commit" 

      end
    end
  end
end

