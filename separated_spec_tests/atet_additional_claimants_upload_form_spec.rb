require 'rails_helper'

RSpec.describe AdditionalClaimantsUploadForm, type: :form do

  let(:additional_claimants_upload_form) { described_class.new(resource) }

  let(:resource) { create :claim, :no_attachments }
  let(:path) { Pathname.new(Rails.root) + 'spec/support/files' }
  let(:file) { File.open(path + 'file.csv') }

  describe "validations" do

    before do
      additional_claimants_upload_form.additional_claimants_csv = file
      additional_claimants_upload_form.assign_attributes(has_additional_claimants: 'true')
      additional_claimants_upload_form.valid?
    end

    describe "attachment additional_claimants_csv" do

      context "a valid csv is attached" do
        it "doesn't have errors" 


        it "updates the number of valid models found on the resource" 

      end

      context "an invalid csv is attached" do
        let(:file) { File.open(path + 'invalid_file.csv') }

        context 'when its value is not a plain text file' do
          let(:file) { File.open(path + 'phil.jpg') }

          it 'adds an error message to the attribute' 

        end

        describe "#csv_errors" do
          it "returns csv validation errors" 

        end

        describe "#erroneous_line_number" do
          it "returns the line number the error occurred on" 

        end
      end
    end

    describe "additional_claimants_csv_record_count" do
      it "gets updated after validation" 

    end
  end

  describe "#has_additional_claimants_csv?" do
    it "returns whether a file is present or not" 

  end

  describe "before validation" do
    context "additional claimants option is not selected"

    before do
      resource.additional_claimants_csv = file
      additional_claimants_upload_form.assign_attributes(has_additional_claimants: 'false')
    end

    it "removes stale data" 

  end
end

