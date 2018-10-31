describe "finding factories keyed by class instead of symbol" do
  before do
    define_model("User") do
      attr_accessor :name, :email
    end

    FactoryBot.define do
      factory :user
    end
  end

  it "doesn't find the factory" 

end

