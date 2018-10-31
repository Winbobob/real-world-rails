require "rails_helper"

describe ExportCsvController do
  let(:export_filename) { "user-archive-codinghorror-150115-234817-999.csv.gz" }

  context "while logged in as normal user" do
    let(:user) { Fabricate(:user) }
    before { sign_in(user) }

    describe "#export_entity" do
      it "enqueues export job" 


      it "should not enqueue export job if rate limit is reached" 


      it "returns 404 when normal user tries to export admin entity" 


      it "correctly logs the entity export" 

    end
  end

  context "while logged in as an admin" do
    let(:admin) { Fabricate(:admin) }
    before { sign_in(admin) }

    describe "#export_entity" do
      it "enqueues export job" 


      it "should not rate limit export for staff" 


      it "correctly logs the entity export" 

    end
  end

  context 'while logged in as a moderator' do
    let(:moderator) { Fabricate(:moderator) }

    before { sign_in(moderator) }

    describe '#export_entity' do
      it 'does not allow moderators to export user_list' 


      it 'allows moderator to export other entities' 

    end
  end
end

