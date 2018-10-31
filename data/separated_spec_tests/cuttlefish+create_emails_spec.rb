# frozen_string_literal: true

describe Mutations::CreateEmails do
  let(:context) { { current_admin: admin } }
  let(:variables) { {} }
  let(:result) do
    CuttlefishSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
  end

  let(:team_one) { create(:team) }
  let(:team_two) { create(:team) }

  let(:admin) { create(:admin, team: team_one) }
  let(:app1) { create(:app, team: team_one) }
  let(:app2) { create(:app, team: team_two) }

  let(:query_string) do
    <<~GRAPHQL
      mutation($id:ID!) {
        createEmails(appId: $id, from: "foo@foo.com", to: "bar@foo.com", subject: "An email", textPart: "Text!") {
          emails {
            id
          }
        }
      }
    GRAPHQL
  end
  let(:variables) { { id: app1.id } }

  it "should return a created email" 


  context "with no current user" do
    let(:context) { {} }

    it "should return nil and error" 

  end

  context "with accessing an app belonging to a different team" do
    let(:variables) { { id: app2.id } }

    it "should return nil and an error" 

  end

  context "non-existent app" do
    let(:variables) { { id: (app2.id + 1) } }

    it "should return nil and error" 

  end
end

