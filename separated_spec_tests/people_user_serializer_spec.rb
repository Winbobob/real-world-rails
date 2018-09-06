require 'spec_helper'

describe Api::V2::UserSerializer do
  let!(:project) { create(:project) }
  let!(:membership) { create(:membership, project: project, user: object) }
  let!(:object) do
    create(:user, uid: 123456, email: 'some@email.com', first_name: 'John',
      last_name: 'Doe', gh_nick: 'johnD', archived: false)
  end

  attributes = %w(uid email first_name last_name gh_nick archived)
  include_examples 'attributes', attributes

  describe '#role' do
    let(:user) { create(:user, :junior) }
    let(:hash) { described_class.new(user).serializable_hash }

    it { expect(hash[:primary_roles]).to eq(user.primary_roles) }
  end

  describe 'assosciations' do
    let(:hash) { described_class.new(object).serializable_hash }

    it 'returns membership with project name' 


    context 'when there are two memberships with same project' do
      let!(:some_user) { create(:user) }
      let!(:project) { create(:project) }
      let!(:membership1) do
        create(:membership, user: some_user, project: project,
          starts_at: 6.months.ago, ends_at: 4.months.ago)
      end
      let!(:membership2) do
        create(:membership, user: some_user, project: project,
          starts_at: 3.months.ago, ends_at: 1.months.ago)
      end
      let(:hash) { described_class.new(some_user).serializable_hash }

      it 'returns only one, newset membership' 

    end
  end
end

