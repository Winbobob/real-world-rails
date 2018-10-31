# frozen_string_literal: true

describe CuttlefishSchema do
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
  let(:app1) { create(:app, team: team_one, name: "App Z") }
  let(:app2) { create(:app, team: team_one, name: "App A") }
  let(:email1) { create(:email, app: app1) }
  let(:email2) { create(:email, app: app2) }
  let(:delivery1) { create(:delivery, email: email1) }
  let(:delivery2) { create(:delivery, email: email2) }

  before :each do
    delivery1
    delivery2
  end

  describe "email" do
    let(:query_string) { "query($id: ID!) { email(id: $id) { id } }" }
    let(:variables) { { id: delivery1.id } }

    it "should return a valid result" 


    context "with no current user" do
      let(:context) { {} }

      it "should return nil and error" 

    end

    context "with a user in a different team" do
      let(:admin) { create(:admin, team: team_two) }

      it "should return nil and an error" 

    end

    context "query for non existing email" do
      let(:variables) { { id: (delivery2.id + 1) } }

      it "should return nil and error" 

    end
  end

  describe "emails" do
    let(:query_string) do
      <<~GRAPHQL
        query($appId: ID, $limit: Int, $offset: Int) {
          emails(appId: $appId, limit: $limit, offset: $offset) {
            totalCount
            nodes {
              id
            }
          }
        }
      GRAPHQL
    end

    it "should return emails" 


    context "with no current user" do
      let(:context) { {} }

      it "should return nil and error" 

    end

    context "with a user in a different team" do
      let(:admin) { create(:admin, team: team_two) }

      it "should return no emails" 

    end

    context "result for one app" do
      let(:variables) { { "appId" => app1.id } }

      it "should return just one email" 

    end

    context "page size of 1" do
      let(:variables) { { limit: 1 } }

      it "should return just one email" 


      context "offset of 1" do
        let(:variables) { { limit: 1, offset: 1 } }

        it "should return just one email" 

      end
    end
  end

  describe "teams" do
    let(:query_string) { "{ teams { admins { name } apps { name } } }" }
    before(:each) do
      team_one
      team_two
    end

    it "should return null" 


    it "should return an error" 


    context "admin is a site admin" do
      let(:admin) do
        create(
          :admin,
          team: team_one,
          site_admin: true,
          name: "Matthew"
        )
      end

      it "should return all the teams" 

    end
  end
end

