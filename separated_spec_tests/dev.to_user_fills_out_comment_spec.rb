require "rails_helper"

RSpec.describe "Creating Comment", type: :feature, js: true do
  let(:user) { create(:user) }
  let(:raw_comment) { Faker::Lorem.paragraph }
  let(:article) do
    create(:article, user_id: user.id, show_comments: true)
  end

  before do
    sign_in user
  end

  it "User fills out comment box normally" 


  # rubocop:disable RSpec/ExampleLength
  it "User fill out commen box then click previews and submit" 


  it "User replies to a comment" 

  # rubocop:enable RSpec/ExampleLength
end

