require 'rails_helper'

describe "UserListPresenter" do
  
  let(:presenter) { UserListPresenter.new(city: "Paris") }
  
  describe "new" do
    it { expect(UserListPresenter.new(city: "Paris").location).to eq("paris") }
    it { expect(UserListPresenter.new("city" => "Paris").location).to eq("paris") }
    it { expect(UserListPresenter.new(city: "Paris").type).to eq(:city) }

    it { expect(UserListPresenter.new(country: "France").location).to eq("france") }
    it { expect(UserListPresenter.new("country" => "France").location).to eq("france") }
    it { expect(UserListPresenter.new(country: "France").type).to eq(:country) }

    it { expect(UserListPresenter.new({}).location).to be nil }
    it { expect(UserListPresenter.new({}).type).to eq(:world) }

    it "sets default language" 


    context "location provided" do
      it "location trim whitespace" 

    end
  end
  
  describe "languages" do
    it { expect(presenter.languages.count).to eq(228) }
    it { expect(presenter.languages.first(3)).to eq([["JavaScript", "javascript"], ["Java", "java"], ["Ruby", "ruby"]]) }
  end
  
  describe "title" do
    it { expect(UserListPresenter.new(city: "paris").title).to eq("in Paris") }
    it { expect(UserListPresenter.new(country: "france").title).to eq("in France") }
    it { expect(UserListPresenter.new({}).title).to eq("worldwide") }
  end
  
  describe "show_location_input" do
    it { expect(UserListPresenter.new(city: "paris").show_location_input?).to eq(true) }
    it { expect(UserListPresenter.new({}).show_location_input?).to eq(false) }
  end
  
  describe "user_ranks" do
    context "has results" do
      it "returns top users for this city and language ordered by city rank" 

    end
    
    context "has no result" do
      it "returns empty" 

    end
  end
end

