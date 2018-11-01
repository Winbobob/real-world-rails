# frozen_string_literal: true
require 'spec_helper'

describe Milestones::UpdateService do
  let(:project) { create(:project) }
  let(:user) { build(:user) }
  let(:milestone) { create(:milestone, project: project) }

  describe '#execute' do
    context "valid params" do
      let(:inner_service) { double(:service) }

      before do
        project.add_maintainer(user)
      end

      subject { described_class.new(project, user, { title: 'new_title' }).execute(milestone) }

      it { expect(subject).to be_valid }
      it { expect(subject.title).to eq('new_title') }

      context 'state_event is activate' do
        it 'calls ReopenService' 

      end

      context 'state_event is close' do
        it 'calls ReopenService' 

      end
    end
  end
end

