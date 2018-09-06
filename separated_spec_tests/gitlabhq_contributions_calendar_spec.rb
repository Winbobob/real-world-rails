require 'spec_helper'

describe Gitlab::ContributionsCalendar do
  let(:contributor) { create(:user) }
  let(:user) { create(:user) }

  let(:private_project) do
    create(:project, :private) do |project|
      create(:project_member, user: contributor, project: project)
    end
  end

  let(:public_project) do
    create(:project, :public, :repository) do |project|
      create(:project_member, user: contributor, project: project)
    end
  end

  let(:feature_project) do
    create(:project, :public, :issues_private) do |project|
      create(:project_member, user: contributor, project: project).project
    end
  end

  let(:today) { Time.now.utc.to_date }
  let(:yesterday) { today - 1.day }
  let(:tomorrow)  { today + 1.day }
  let(:last_week) { today - 7.days }
  let(:last_year) { today - 1.year }

  before do
    travel_to Time.now.utc.end_of_day
  end

  after do
    travel_back
  end

  def calendar(current_user = nil)
    described_class.new(contributor, current_user)
  end

  def create_event(project, day, hour = 0, action = Event::CREATED, target_symbol = :issue)
    @targets ||= {}
    @targets[project] ||= create(target_symbol, project: project, author: contributor)

    Event.create!(
      project: project,
      action: action,
      target: @targets[project],
      author: contributor,
      created_at: DateTime.new(day.year, day.month, day.day, hour)
    )
  end

  describe '#activity_dates' do
    it "returns a hash of date => count" 


    it "only shows private events to authorized users" 


    it "counts the diff notes on merge request" 


    it "counts the discussions on merge requests and issues" 


    context "when events fall under different dates depending on the time zone" do
      before do
        create_event(public_project, today, 1)
        create_event(public_project, today, 4)
        create_event(public_project, today, 10)
        create_event(public_project, today, 16)
        create_event(public_project, today, 23)
      end

      it "renders correct event counts within the UTC timezone" 


      it "renders correct event counts within the Sydney timezone" 


      it "renders correct event counts within the US Central timezone" 

    end
  end

  describe '#events_by_date' do
    it "returns all events for a given date" 


    it "only shows private events to authorized users" 


    context 'when the user cannot read read cross project' do
      before do
        allow(Ability).to receive(:allowed?).and_call_original
        expect(Ability).to receive(:allowed?).with(user, :read_cross_project) { false }
      end

      it 'does not return any events' 

    end
  end

  describe '#starting_year' do
    it "should be the start of last year" 

  end

  describe '#starting_month' do
    it "should be the start of this month" 

  end
end

