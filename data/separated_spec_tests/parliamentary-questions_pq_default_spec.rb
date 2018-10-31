require 'spec_helper'

describe Export::PqDefault do
  include Unit::QuestionFactory
  include CSVHelpers

  let(:export) {
    Export::PqDefault.new(Date.yesterday, Date.today)
  }

  context "For output to Excel" do
    it "Inserts a single quote to escape a formula in Excel" 

    it "Doesn't alter a value if it doesn't start with an equals" 

  end

  context "when no records are present" do
    it "returns a blank CSV" 

  end

  context "when some records are present" do
    before(:each) do
      # Expected exclusions
      mk_pq('uin-1', answer_submitted: Date.today - 5)
      mk_pq('uin-2', tabled_date: Date.today + 1)
      mk_pq('uin-3', transfer_out_ogd_id: 1, transfer_out_date: Date.today)

      # Expected inclusions
      mk_pq('uin-z')
      mk_pq('uin-a')
      mk_pq('uin-c')
    end

    it "returns unanswered, and non transfered-out pqs, within the supplied date range ordered by UIN" 

  end
end

