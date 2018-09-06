require "spec_helper"

describe SignaturesHelper do
  describe "#signers_description" do
    context "when there is locality and region" do
      it "returns signer's name and where they are from" 

    end

    context "when there is only a zipcode" do
      it "returns signer's name only", :vcr do
        signer = FactoryGirl.create(:user, locality: "", region: "")
        without_where = "#{signer.given_name} #{signer.family_name}"

        expect{
          helper.signers_description(signer) =~ /#{without_where}$/
        }.to be_true
      end
    end

    context "when there is an avatar" do
      it "includes avatar of user" 

    end
  end
end

