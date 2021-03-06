require 'rails_helper'

RSpec.describe AdditionalClaimantsCsv::ErrorConversion, type: :service do

  let(:header) {
    ["Title", "First name", "Last name", "Date of birth", "Building number or name",
     "Street", "Town/city", "County", "Postcode"]
  }

  let(:model_errros) { ActiveModel::Errors.new(Object.new) }

  describe "#convert" do

    before do
      model_errros.add(:title, "such invalid title")
      model_errros.add(:address_street, "so very long text")
    end

    context "adapts the error message to include the header it relates to" do
      describe "retruns an array of error messages" do
        let(:errors) { described_class.new(header, model_errros).convert }

        it { expect(errors.size).to eq 2 }
        it { expect(errors.first).to eq "Title - such invalid title" }
        it { expect(errors.second).to eq "Street - so very long text" }
      end
    end
  end
end

