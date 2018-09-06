require "spec_helper"

describe "modifying inherited factories with traits" do
  before do
    define_model('User', gender: :string, admin: :boolean, age: :integer)
    FactoryBot.define do
      factory :user do
        trait(:female) { gender "Female" }
        trait(:male)   { gender "Male" }

        trait(:young_admin) do
          admin true
          age   17
        end

        female
        young_admin

        factory :female_user do
          gender "Female"
          age 25
        end

        factory :male_user do
          gender "Male"
        end
      end
    end
  end

  it "returns the correct value for overridden attributes from traits" 


  it "returns the correct value for overridden attributes from traits defining multiple attributes" 


  it "allows modification of attributes created via traits" 

end

