require 'spec_helper'

describe ProjectsController do
  let(:admin_user) { create(:user, :admin) }

  before { sign_in(admin_user) }

  describe '#show' do
    subject { create(:project) }
    before { get :show, id: subject }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes project' 

  end

  describe '#new' do
    before { get :new }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes new project' 

  end

  describe '#create' do
    context 'with valid attributes' do
      subject { attributes_for(:project) }

      it 'creates a new project' 

    end

    context 'with invalid attributes' do
      subject { attributes_for(:invalid_project) }

      it 'does not save' 

    end
  end

  describe '#destroy' do
    let!(:project) { create(:project) }

    it 'deletes the contact' 

  end

  describe '#update' do
    let!(:project) { create(:project, name: 'hrguru') }
    let(:current_membership) { create(:membership, starts_at: 1.week.ago, ends_at: 1.week.from_now, stays: true, project: new_project) }
    let(:old_membership) { create(:membership, starts_at: 2.weeks.ago, ends_at: 1.week.ago, stays: false, project: new_project) }
    let(:slack_config) { OpenStruct.new(webhook_url: 'webhook_url', username: 'PeopleApp') }
    let(:response_ok) { Net::HTTPOK.new('1.1', 200, 'OK') }

    context 'changes potential from true to false' do
      let(:new_project) { create(:project, potential: true) }

      before do
        allow(AppConfig).to receive(:slack).and_return(slack_config)
        allow_any_instance_of(Membership).to receive(:notify_slack_on_create)
        allow_any_instance_of(Membership).to receive(:notify_slack_on_update)
        expect_any_instance_of(Slack::Notifier).to receive(:ping).and_return(response_ok)
        expect_any_instance_of(Memberships::UpdateBooked).to receive(:call)
        expect_any_instance_of(Projects::EndCurrentMemberships).to_not receive(:call)
        new_project.memberships << [current_membership, old_membership]
        put :update, id: new_project, project: attributes_for(:project, potential: false)
        new_project.reload
      end

      it 'return current membership' 


      it 'deletes unnecessary memberships' 


      it 'changes starts_at' 

    end

    context 'changes potential from false to true' do
      let!(:new_project) { create(:project, potential: false) }

      before do
        new_project.memberships << [current_membership, old_membership]
        allow(AppConfig).to receive(:slack).and_return(slack_config)
        expect_any_instance_of(Slack::Notifier).to receive(:ping).and_return(response_ok)
        expect_any_instance_of(Memberships::UpdateBooked).to_not receive(:call)
        expect_any_instance_of(Projects::EndCurrentMemberships).to_not receive(:call)
      end

      it 'return all memberships' 

    end

    it 'exposes project' 


    context 'valid attributes' do
      before do
        allow(AppConfig).to receive(:slack).and_return(slack_config)
        expect_any_instance_of(Slack::Notifier).to receive(:ping).and_return(response_ok)
        expect_any_instance_of(Projects::EndCurrentMemberships).to_not receive(:call)
      end

      it "changes project's attributes" 

    end

    context 'invalid attributes' do
      it "does not change project's attributes" 

    end

    context 'archiving project' do
      let(:memberships) { [create(:membership, :without_end), create(:membership, :without_end)] }
      let(:project) { create(:project, memberships: memberships) }
      let(:params) { { id: project.id, project: { archived: 'true' } } }

      before do
        expect_any_instance_of(Memberships::UpdateBooked).to_not receive(:call)
        expect_any_instance_of(Projects::EndCurrentMemberships).to receive(:call)
      end

      it 'changes archived to true' 

    end
  end
end

