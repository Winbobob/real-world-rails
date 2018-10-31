require "rails_helper"

RSpec.describe "InternalBufferUpdates", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, commentable_id: article.id) }

  before do
    sign_in user
    user.add_role(:super_admin)
  end

  it "creates buffer update for tweet if tweet params are passed" 


  it "updates last buffered at" 


  it "updates last buffered at with satellite buffer" 


  it "updates last facebook buffered at" 

end

