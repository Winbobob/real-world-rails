# frozen_string_literal: true

require "integration/federation/federation_helper"

def create_remote_contact(user, pod_host)
  FactoryGirl.create(
    :contact,
    user:   user,
    person: FactoryGirl.create(
      :person,
      pod:             Pod.find_or_create_by(url: "http://#{pod_host}"),
      diaspora_handle: "#{r_str}@#{pod_host}"
    )
  )
end

shared_examples_for "old person account is closed and profile is cleared" do
  subject { old_user.person }

  before do
    run_migration
    subject.reload
  end

  include_examples "it makes account closed and clears profile"
end

shared_examples_for "old person doesn't have any reference left" do
  let(:person) { old_user.person }

  before do
    DataGenerator.create(person, :generic_person_data)
  end

  def account_removal_method
    run_migration
    person.reload
  end

  include_examples "it removes the person associations"

  include_examples "it removes the person conversations"
end

shared_examples_for "every migration scenario" do
  it_behaves_like "it updates person references"

  it_behaves_like "old person account is closed and profile is cleared"

  it_behaves_like "old person doesn't have any reference left"
end

shared_examples_for "migration scenarios with local old user" do
  it "locks the old user account" 

end

shared_examples_for "migration scenarios initiated remotely" do
  it "resends known contacts to the new user" 

end

shared_examples_for "migration scenarios initiated locally" do
  it "dispatches account migration message to the federation" 

end

describe "account migration" do
  # this is the case when we receive account migration message from the federation
  context "remotely initiated" do
    let(:entity) { create_account_migration_entity(old_user.diaspora_handle, new_user) }

    def run_migration
      allow_callbacks(%i[queue_public_receive fetch_public_key receive_entity])
      post_message(generate_payload(entity, old_user))
    end

    context "both new and old profiles are remote" do
      include_context "with remote old user"
      include_context "with remote new user"

      it "creates AccountMigration db object" 


      include_examples "every migration scenario"

      include_examples "migration scenarios initiated remotely"
    end

    # this is the case when we're a pod, which was left by a person in favor of remote one
    context "old user is local, new user is remote" do
      include_context "with local old user"
      include_context "with remote new user"

      include_examples "every migration scenario"

      include_examples "migration scenarios initiated remotely"

      it_behaves_like "migration scenarios with local old user"

      it_behaves_like "deletes all of the user data" do
        let(:user) { old_user }

        before do
          DataGenerator.create(user, :generic_user_data)
        end

        def account_removal_method
          run_migration
          user.reload
        end
      end
    end
  end

  context "locally initiated" do
    before do
      allow(DiasporaFederation.callbacks).to receive(:trigger).and_call_original
    end

    # this is the case when user migrates to our pod from a remote one
    context "old user is remote and new user is local" do
      include_context "with remote old user"
      include_context "with local new user"

      def run_migration
        AccountMigration.create!(
          old_person:      old_user.person,
          new_person:      new_user.person,
          old_private_key: old_user.serialized_private_key
        ).perform!
      end

      include_examples "every migration scenario"

      it_behaves_like "migration scenarios initiated locally" do
        let!(:remote_contact) { create_remote_contact(new_user, "remote-friend.org") }
      end
    end

    # this is the case when a user changes diaspora id but stays on the same pod
    context "old user is local and new user is local" do
      include_context "with local old user"
      include_context "with local new user"

      def run_migration
        AccountMigration.create!(old_person: old_user.person, new_person: new_user.person).perform!
      end

      include_examples "every migration scenario"

      it_behaves_like "migration scenarios initiated locally" do
        let!(:remote_contact) { create_remote_contact(old_user, "remote-friend.org") }
      end

      it_behaves_like "migration scenarios with local old user"

      it "clears the old user account" 


      it_behaves_like "it updates user references"
    end
  end
end

