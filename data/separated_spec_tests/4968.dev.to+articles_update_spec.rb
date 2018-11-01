require "rails_helper"

RSpec.describe "ArticlesUpdate", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }

  before do
    sign_in user
  end

  it "updates ordinary article with proper params" 


  # rubocop:disable RSpec/ExampleLength
  it "does not create a job opportunity if no hiring tag" 


  it "updates ordinary article with job opportunity nested" 

  # rubocop:enable RSpec/ExampleLength
end

