require "spec_helper"

describe OrganizationExportWorker do
  let(:subject) { OrganizationExportWorker }
  let(:instance) { subject.new }
  let(:export) { FactoryGirl.create(:export_organization, progress: "pending", file: nil) }
  let(:organization) { export.organization }
  let(:black) { FactoryGirl.create(:color, name: "Black") } # Because we use it as a default color
  let(:trek) { FactoryGirl.create(:manufacturer, name: "Trek") }
  let(:bike) { FactoryGirl.create(:creation_organization_bike, manufacturer: trek, primary_frame_color: black, organization: organization) }
  let(:basic_values) do
    [
      "http://test.host/bikes/#{bike.id}",
      bike.created_at.utc,
      "Trek",
      nil,
      "Black",
      bike.serial_number,
      nil
    ]
  end
  let(:csv_string) { csv_lines.map { |r| instance.comma_wrapped_string(r) }.join }

  describe "perform" do
    context "bulk import already processed" do
      let(:export) { FactoryGirl.create(:export, progress: "finished") }
      it "returns true" 

    end
    context "default" do
      let(:csv_lines) { [export.headers, basic_values] }
      it "does the thing we expect" 

    end
    context "no bikes" do
      let(:csv_lines) { [export.headers] }
      let(:export) { FactoryGirl.create(:export_organization, progress: "pending", file: nil, end_at: Time.now - 1.week) }
      it "finishes export" 

    end

    context "all headers" do
      # Setting up what we have, rather than waiting on everything
      let(:export) { FactoryGirl.create(:export_organization, progress: "pending", file: nil, options: { headers: Export::PERMITTED_HEADERS }) }
      let(:secondary_color) { FactoryGirl.create(:color) }
      let(:email) { "testly@bikeindex.org" }
      let(:bike) do
        FactoryGirl.create(:creation_organization_bike,
                           organization: organization,
                           manufacturer: Manufacturer.other,
                           frame_model: '",,,\"<script>XSSSSS</script>',
                           year: 2001,
                           manufacturer_other: "Sweet manufacturer <><>><\\",
                           primary_frame_color: Color.black,
                           secondary_frame_color: secondary_color,
                           owner_email: email)
      end
      let!(:ownership) { FactoryGirl.create(:ownership, bike: bike, creator: FactoryGirl.create(:confirmed_user, name: "other person"), user: FactoryGirl.create(:user, name: "George Smith", email: "testly@bikeindex.org")) }
      let(:csv_lines) { [export.headers, fancy_bike_values] }
      let(:fancy_bike_values) do
        [
          "http://test.host/bikes/#{bike.id}",
          bike.created_at.utc,
          "Sweet manufacturer &lt;&gt;&lt;&gt;&gt;",
          "\",,,\"<script>XSSSSS</script>",
          "Black, #{secondary_color.name}",
          bike.serial_number,
          nil,
          nil,
          nil, # Since user isn't part of organization. TODO: Currently not implemented
          nil,
          email,
          "George Smith"
        ]
      end
      let(:target_csv_line) { "\"http://test.host/bikes/#{bike.id}\",\"#{bike.created_at.utc}\",\"Sweet manufacturer &lt;&gt;&lt;&gt;&gt;\",\"\\\",,,\\\"<script>XSSSSS</script>\",\"Black, #{secondary_color.name}\",\"#{bike.serial_number}\",\"\",\"\",\"\",\"\",\"#{email}\",\"George Smith\"" }
      it "exports with all the header values" 

    end
  end

  context "with assigned export" do
    before { instance.export = export }

    describe "bike_to_row" do
      context "default" do
        it "returns the hash we want" 

      end
    end
  end
end

