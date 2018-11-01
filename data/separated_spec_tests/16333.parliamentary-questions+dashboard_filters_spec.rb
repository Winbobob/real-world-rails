require 'spec_helper'

describe Presenters::DashboardFilters do
  include Rails.application.routes.url_helpers

  describe "#build" do
    let(:counts) {{
      'view_all'  => 50,
      PQState::UNASSIGNED => 1,
      PQState::NO_RESPONSE => 2,
    }}

    let(:params) {{
      :controller => 'dashboard',
      :action     => 'index'
    }}

    it "produces the expected filter values" 

  end

  describe "#build_in_progress" do
    let(:counts) {{
      'view_all_in_progress'     => 12,
      PQState::DRAFT_PENDING     => 1,
      PQState::WITH_POD          => 2,
      PQState::POD_QUERY         => 3,
      PQState::MINISTER_CLEARED  => 4,
      'iww'                      => 2,
    }}

    let(:params) {{
      :controller => 'dashboard',
      :action     => 'in_progress_by_status',
      :qstatus    => PQState::POD_QUERY,
    }}

    it "initialises filters with the expected values" 

  end
end

