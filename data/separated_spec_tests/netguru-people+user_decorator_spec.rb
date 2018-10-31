require 'spec_helper'

describe UserDecorator do
  def time(year, month, day)
    Time.new(year, month, day)
  end

  let(:team) { create(:team) }
  let(:user) { create(:user, teams: [team], team_join_time: 6.days.ago) }
  let(:user_without_team) { create(:user) }
  subject { user.decorate }

  describe '#project_names' do
    let!(:membership) { create(:membership, user: user) }

    before { subject.reload }

    it { expect(subject.project_names).to eq [membership.project.name] }
  end

  describe '#gravatar_image' do
    it { expect(subject.gravatar_image).to include(subject.gravatar_url.to_s) }
  end

  describe '#github_link' do
    before do
      user.gh_nick = 'github_nick'
    end
    it { expect(subject.github_link).to include('github_nick') }
  end

  describe '#skype_link' do
    before do
      user.skype = 'skype_login'
    end
    it { expect(subject.skype_link).to include('skype_login') }
  end

  describe '#current_projects_with_memberships_json' do
    let!(:project) { create(:project, name: 'google') }

    it "returns projects list to include 'google' project" 


    it 'returns no projects' 


    it 'returns projects array to include 2 projects' 

  end

  describe '#potential_projects_json' do
    let!(:project_potential) { create(:project, potential: true) }

    context 'when user belongs to potential project' do
      before do
        create(:membership, starts_at: 2.days.ago, ends_at: nil,
                            user: subject, project: project_potential)
      end

      it 'returns potential project' 

    end

    context 'when user used to belong to potential project' do
      before do
        create(:membership, starts_at: 10.days.ago, ends_at: 5.days.ago,
                            user: subject, project: project_potential)
      end

      it 'returns no potential project' 

    end
  end

  describe '#next_projects_json' do
    let!(:project_current) { create(:project, name: 'google') }
    let!(:project_next) { create(:project, name: 'facebook') }

    before { Timecop.freeze(Time.local(2013, 12, 1)) }
    after { Timecop.return }

    context 'when user has unstarted membership' do
      before do
        create(:membership, starts_at: time(2012, 1, 1), ends_at: nil,
                            user: subject, project: project_current)
        create(:membership, starts_at: time(2013, 12, 15), ends_at: nil,
                            user: subject, project: project_next)
      end

      it 'returns next project' 

    end
  end
end

