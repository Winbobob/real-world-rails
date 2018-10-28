require "rails_helper"

RSpec.describe "Blocks", type: :request do
  let(:user) { create(:user, :super_admin) }

  before { sign_in user }

  describe "GET blocks index" do
    it "renders proper blocks index" 

  end

  # rubocop:disable RSpec/ExampleLength
  describe "POST blocks" do
    it "creates block from input data" 

  end

  describe "PUT blocks" do
    it "updates block from input data" 

  end
  # rubocop:enable RSpec/ExampleLength

  describe "DELETE blocks" do
    it "updates block from input data" 

  end
end

