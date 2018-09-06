require 'spec_helper'

describe Presenters::Report do
  include Rails.application.routes.url_helpers

  def header_values(r)
    r.header_cells.map { |c| [c.label, c.path] }
  end

  def row_values(r)
    [r.label, r.cells.map { |c| [c.count, c.path] }]
  end

  let(:ministers)       { DBHelpers.ministers                                     }
  let(:press_desks)     { DBHelpers.press_desks                                   }
  let(:minister_report) { Presenters::Report.ministers(report_data, ministers)    }
  let(:pd_report)       { Presenters::Report.press_desk(report_data, press_desks) }
  let(:report_data)     { {}                                                      }

  describe "#header_values" do
    context "minister report" do
      it "produces the expected header values" 

    end

    context "press desk report" do
      it "produces the expected header values" 

    end
  end

  describe "#rows" do
    context "when no data is supplied" do
      it "produces the expected row values" 

    end

    context "when some data is supplied" do
      let(:report_data) {{
        PQState::WITH_POD => {
          press_desks[0].id => 10,
          press_desks[1].id => 20
        }
      }}

      it "produces the expected row values" 

    end
  end
end

