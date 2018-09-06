require "spec_helper"

describe "skipping the default create" do
  before do
    define_model("User", email: :string)

    FactoryBot.define do
      factory :user do
        skip_create

        email "john@example.com"
      end
    end
  end

  it "doesn't execute anything when creating the instance" 

end

