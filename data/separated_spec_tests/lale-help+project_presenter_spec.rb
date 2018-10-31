require 'rails_helper'

describe ProjectPresenter do
  describe "calendar_leaf_title_date" do

    let(:presenter) { ProjectPresenter.new(project) }

    context "project has tasks" do
      let(:project)   { create(:project, start_date:Date.parse("2016-09-01"), due_date:   Date.parse("2016-10-31"))}

      context "current date is in project range" do
        before { Timecop.freeze(Time.parse("2016-09-30")) }
        after  { Timecop.return }
        it "shows the current month" 

      end

      context "current date is after project range" do
        before { Timecop.freeze(Time.parse("2016-11-01")) }
        after  { Timecop.return }
        it "shows the project's last month" 

      end

      context "current date is before project range" do
        before { Timecop.freeze(Time.parse("2016-08-01")) }
        after  { Timecop.return }
        it "shows the project's first month" 

      end
    end

    context "project has no tasks" do
      let(:project)   { create(:project) }
      before { Timecop.freeze(Time.parse("2016-11-01")) }
      after  { Timecop.return }
      it "shows the current month" 

    end

  end
end

