require "spec_helper"

describe BulkImportWorker do
  let(:subject) { BulkImportWorker }
  let(:instance) { subject.new }
  it { is_expected.to be_processed_in :afterwards }
  let(:bulk_import) { FactoryGirl.create(:bulk_import, progress: "pending") }
  let!(:black) { FactoryGirl.create(:color, name: "Black") } # Because we use it as a default color

  let(:sample_csv_lines) do
    [
      %w[manufacturer model year color email serial],
      ["Trek", "Roscoe 8", "2019", "Green", "test@bikeindex.org", "xyz_test"],
      ["Surly", "Midnight Special", "2018", "White", "test2@bikeindex.org", "example"]
    ]
  end
  let(:csv_lines) { sample_csv_lines }
  let(:csv_string) { csv_lines.map { |r| r.join(",") }.join("\n") }

  describe "perform" do
    context "bulk import already processed" do
      let(:bulk_import) { FactoryGirl.create(:bulk_import, progress: "finished") }
      it "returns true" 

    end
    context "valid bike and an invalid bike" do
      let!(:color) { FactoryGirl.create(:color, name: "White") }
      let(:error_line) { ["Trek", "Roscoe 8", "2019", "White", nil, "xyz_test"] }
      let(:target_line_error) { [1, ["Owner email can't be blank"]] }
      let(:csv_lines) { [sample_csv_lines[0], error_line, sample_csv_lines[2]] }
      it "registers bike, adds row that is an error" 

    end
    context "valid file" do
      let!(:green) { FactoryGirl.create(:color, name: "Green") }
      let!(:white) { FactoryGirl.create(:color, name: "White") }
      let!(:surly) { FactoryGirl.create(:manufacturer, name: "Surly") }
      let!(:trek) { FactoryGirl.create(:manufacturer, name: "Trek") }
      let(:file_path) { File.open(Rails.root.join("public", "import_all_optional_fields.csv")) }
      let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
      let!(:bulk_import) { FactoryGirl.create(:bulk_import, file: file_path, progress: "pending", user_id: nil, organization_id: organization.id) }
      it "creates the bikes, doesn't have any errors" 

    end
  end

  context "with assigned bulk import" do
    before { instance.bulk_import = bulk_import }
    describe "process_csv" do
      context "without a header" do
        let(:csv_lines) { sample_csv_lines.slice(1, 2) }
        it "adds a file error" 

      end
      context "with an invalid header" do
        let(:csv_lines) { [%w[manufacturer email name color]] + sample_csv_lines.slice(1, 2) }
        it "adds a file error" 

      end
      context "with failed row" do
        let(:error_line) { ["Surly", "Midnight Special", "2018", nil, " ", "example"] }
        let(:csv_lines) { [sample_csv_lines[0], error_line] }
        let(:target_line_error) { [1, ["Owner email can't be blank"]] }
        it "registers a bike and adds a row error" 

      end
      context "with two valid bikes" do
        let(:bparam_line1) { instance.row_to_b_param_hash(sample_csv_lines[0].map(&:to_sym).zip(csv_lines[1]).to_h) }
        let(:bparam_line2) { instance.row_to_b_param_hash(sample_csv_lines[0].map(&:to_sym).zip(csv_lines[2]).to_h) }
        it "calls register bike with the valid bikes" 

      end
    end

    describe "row_to_b_param_hash" do
      let(:row) { sample_csv_lines[0].map(&:to_sym).zip(csv_lines[1]).to_h }
      let(:target) do
        {
          owner_email: row[:email],
          manufacturer_id: "Trek",
          is_bulk: true,
          color: "Green",
          serial_number: row[:serial],
          year: row[:year],
          frame_model: "Roscoe 8",
          send_email: true,
          creation_organization_id: nil
        }
      end
      describe "row_to_b_param_hash" do
        context "some extra bits" do
          it "returns the hash we want" 

        end
        context "with organization" do
          let(:organization) { FactoryGirl.create(:organization) }
          let!(:bulk_import) { FactoryGirl.create(:bulk_import, organization: organization, no_notify: true) }
          it "registers with organization" 

        end
      end
    end

    describe "register bike" do
      let!(:manufacturer) { FactoryGirl.create(:manufacturer, name: "Surly") }
      context "valid organization bike" do
        let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
        let!(:bulk_import) { FactoryGirl.create(:bulk_import, organization: organization) }
        let(:row) { { manufacturer: " Surly", serial: "na", color: nil, email: "test2@bikeindex.org", year: "2018", model: "Midnight Special" } }
        it "registers a bike" 

      end
      context "not valid bike" do
        let(:row) { { manufacturer_id: "\n", serial: "na", color: nil } }
        let(:target_errors) { ["Owner email can't be blank"] }
        it "returns the invalid bike with errors" 

      end
    end

    describe "rescue_blank_serials" do
      let(:blank_examples) { ["NA", "N/A", "unkown", "unkown", "           ", "none"] }
      let(:non_blank_examples) { %w[somethingna none8xc9x] }
      it "rescues blank serials, doesn't rescue non blank serials" 

    end
  end
end

