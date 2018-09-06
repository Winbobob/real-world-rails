require 'rails_helper'

describe ProjectPresenter do
  let(:user) { create :user, :with_team, email: 'foobar@example.com' }
  let(:tag_group) { create :tag_group }

  before { create :project, name: 'Test Project Foobar', users: [user], tag_group: tag_group }

  let(:projects) { ProjectPresenter.from_collection(Project.all) }
  let(:project) { projects.first }

  describe '#truncate_name' do
    it { expect(project.truncate_name.length).to eq(18) }
  end

  describe '#tag_fore_color' do
    it { expect(project.tag_fore_color).to eq('#000000') }
  end

  describe '#velocity' do
    it { expect(project.velocity).to eq(10) }
  end

  describe '#volatility' do
    it { expect(project.volatility).to eq('0%') }
  end

  describe '#users_avatar' do
    it 'should return the right users avatar' 

  end

  describe '#archived_at' do
    it 'should render a formated date' 

  end

  describe '#path_to' do
    it 'should return all paths' 

  end
end

