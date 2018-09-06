require 'spec_helper'

RSpec.describe ReportsController, :type => :controller do

  before :each do
    @buddha = create :user
    @ananda = create :user, username: 'ananda'
    @sit = create :sit, user: @buddha
    @report = build :report, user: @ananda, reportable_id: @sit.id, reportable_type: @sit.class.to_s
    sign_in :user, @ananda
  end

  describe "POST create" do
    it "creates a report" 

  end

end

