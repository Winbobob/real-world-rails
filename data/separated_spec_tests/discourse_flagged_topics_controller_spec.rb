require 'rails_helper'

RSpec.describe Admin::FlaggedTopicsController do
  let!(:flag) { Fabricate(:flag) }

  shared_examples "successfully retrieve list of flagged topics" do
    it "returns a list of flagged topics" 

  end

  context "as admin" do
    before do
      sign_in(Fabricate(:admin))
    end

    include_examples "successfully retrieve list of flagged topics"
  end

  context "as moderator" do
    before do
      sign_in(Fabricate(:moderator))
    end

    include_examples "successfully retrieve list of flagged topics"
  end

end

