require "spec_helper"

describe Gitlab::GoogleCodeImport::Importer do
  let(:mapped_user) { create(:user, username: "thilo123") }
  let(:raw_data) { JSON.parse(fixture_file("GoogleCodeProjectHosting.json")) }
  let(:client) { Gitlab::GoogleCodeImport::Client.new(raw_data) }
  let(:import_data) do
    {
      'repo' => client.repo('tint2').raw_data,
      'user_map' => { 'thilo...' => "@#{mapped_user.username}" }
    }
  end
  let(:project) { create(:project) }

  subject { described_class.new(project) }

  before do
    project.add_maintainer(project.creator)
    project.create_import_data(data: import_data)
  end

  describe "#execute" do
    it "imports status labels" 


    it "imports labels" 


    it "imports issues" 


    it "imports issue comments" 

  end
end

