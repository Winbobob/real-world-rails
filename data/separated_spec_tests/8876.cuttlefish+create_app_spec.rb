# frozen_string_literal: true

describe Mutations::CreateApp do
  let(:result) do
    CuttlefishSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
  end
  let(:query_string) do
    <<~GRAPHQL
      mutation ($name: String!) {
        createApp(attributes: { name: $name }) {
          app {
            name
          }
          errors {
            path
            message
            type
          }
        }
      }
    GRAPHQL
  end
  let(:context) { { current_admin: current_admin } }
  let(:name) { "An App" }
  let(:variables) { { name: name } }
  let(:current_admin) { create(:admin) }

  it "should not return any errors" 


  it "should create an app" 


  it "should return the created app" 


  context "user does not have permission" do
    let(:app_policy) { double }
    before :each do
      expect(AppPolicy).to receive(:new) { app_policy }
      expect(app_policy).to receive(:create?) { false }
    end

    it "should return an error" 

  end

  context "invalid name" do
    let(:name) { "sd^&" }

    it "should return a nil app and a validation error" 

  end
end

