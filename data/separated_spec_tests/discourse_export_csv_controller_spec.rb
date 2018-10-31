require "rails_helper"

describe ExportCsvController do
  let(:export_filename) { "user-archive-codinghorror-150115-234817-999.csv.gz" }

  context "while logged in as normal user" do
    before { @user = log_in(:user) }

    describe ".export_entity" do
      it "enqueues export job" 


      it "should not enqueue export job if rate limit is reached" 


      it "returns 404 when normal user tries to export admin entity" 

    end
  end

  context "while logged in as an admin" do
    before { @admin = log_in(:admin) }

    describe ".export_entity" do
      it "enqueues export job" 


      it "should not rate limit export for staff" 

    end
  end
end

