require 'spec_helper'

describe "admin_user/_user_table.html.erb" do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:users) do
    user_array = [
      FactoryBot.create(:user, name: "Samuel Beckett"),
      FactoryBot.create(:user, name: "Fintan O'Toole")
    ]
    allow(user_array).to receive(:total_pages).and_return(1)
    user_array
  end

  it 'does not double escape apostrophes' 

end

