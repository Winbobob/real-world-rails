# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Email::Handler::CreateIssueHandler do
  include_context :email_shared_context
  it_behaves_like :reply_processing_shared_examples

  before do
    stub_incoming_email_setting(enabled: true, address: "incoming+%{key}@appmail.adventuretime.ooo")
    stub_config_setting(host: 'localhost')
  end

  let(:email_raw) { fixture_file('emails/valid_new_issue.eml') }
  let(:namespace) { create(:namespace, path: 'gitlabhq') }

  let!(:project)  { create(:project, :public, namespace: namespace, path: 'gitlabhq') }
  let!(:user) do
    create(
      :user,
      email: 'jake@adventuretime.ooo',
      incoming_email_token: 'auth_token'
    )
  end

  context "when everything is fine" do
    it "creates a new issue" 


    context "when the reply is blank" do
      let(:email_raw) { fixture_file("emails/valid_new_issue_empty.eml") }

      it "creates a new issue" 

    end

    context "when there are quotes in email" do
      let(:email_raw) { fixture_file("emails/valid_new_issue_with_quote.eml") }

      it "creates a new issue" 

    end
  end

  context "something is wrong" do
    context "when the issue could not be saved" do
      before do
        allow_any_instance_of(Issue).to receive(:persisted?).and_return(false)
      end

      it "raises an InvalidIssueError" 

    end

    context "when we can't find the incoming_email_token" do
      let(:email_raw) { fixture_file("emails/wrong_incoming_email_token.eml") }

      it "raises an UserNotFoundError" 

    end

    context "when project is private" do
      let(:project) { create(:project, :private, namespace: namespace) }

      it "raises a ProjectNotFound if the user is not a member" 

    end
  end
end

