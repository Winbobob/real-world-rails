# frozen_string_literal: true

describe Mutations::RemoveAdmin do
  let(:result) do
    CuttlefishSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
  end
  let(:query_string) do
    <<~GRAPHQL
      mutation ($id: ID!) {
        removeAdmin(id: $id) {
          admin {
            id
          }
        }
      }
    GRAPHQL
  end
  let(:context) { { current_admin: current_admin } }
  let(:variables) { { id: admin.id } }
  let(:current_admin) { create(:admin, team: team_one) }
  let(:admin) { create(:admin, team: team_one) }
  let(:team_one) { create(:team) }
  let(:team_two) { create(:team) }

  it "should remove an admin" 


  it "should return the deleted admin" 


  context "trying to remove non-existent admin" do
    before(:each) { admin.destroy! }

    it "should return nil for the result and an error" 

  end

  context "trying to remove an admin in another team" do
    let(:admin) { create(:admin, team: team_two) }

    it "should return nil for the result and an error" 

  end
end

