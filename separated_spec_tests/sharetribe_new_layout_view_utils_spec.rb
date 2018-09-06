require 'spec_helper'

describe NewLayoutViewUtils do
  before do
    allow(NewLayoutViewUtils).to receive(:published_features).and_return(
      [
        { title: "Foo",
          name: :foo
        },
        { title: "Bar",
          name: :bar
        },
        { title: "Wat",
          name: :wat
        }
      ])

    allow(NewLayoutViewUtils).to receive(:experimental_features).and_return({})
  end

  describe "#features" do
    person_id = "xyz"
    community_id = 123

    context "when features are enabled for person and community" do
      before do
        person_features = FeatureFlagService::Store::FeatureFlag::PersonFlag.call(
          {
            person_id: person_id,
            features: [:foo, :bar].to_set
          }
        )

        community_features = FeatureFlagService::Store::FeatureFlag::CommunityFlag.call(
          {
            community_id: community_id,
            features: [:wat].to_set
          }
        )

        allow(FeatureFlagService::API::Api.features).to receive(:get_for_person)
          .with({community_id: community_id, person_id: person_id}).and_return(Result::Success.new(person_features))
        allow(FeatureFlagService::API::Api.features).to receive(:get_for_community)
          .with({community_id: community_id}).and_return(Result::Success.new(community_features))
      end

      it "should return list of feature flags with corresponding features enabled for person and community" 

    end

    context "when no features are enabled for person or community" do
      before do
        person_features = FeatureFlagService::Store::FeatureFlag::PersonFlag.call(
          {
            person_id: person_id,
            features: Set.new
          }
        )

        community_features = FeatureFlagService::Store::FeatureFlag::CommunityFlag.call(
          {
            community_id: community_id,
            features: Set.new
          }
        )

        allow(FeatureFlagService::API::Api.features).to receive(:get_for_person)
          .with({community_id: community_id, person_id: person_id}).and_return(Result::Success.new(person_features))
        allow(FeatureFlagService::API::Api.features).to receive(:get_for_community)
          .with({community_id: community_id}).and_return(Result::Success.new(community_features))
      end

      it "should return list of feature flags with no features enabled" 

    end
  end

  describe "#enabled_features" do
    context "when features are enabled" do
      it "returns a list of those as symbols" 

    end

    context "when an empty hash is passed as params" do
      it "returns an empty list" 

    end

    context "when invalid features are passed as params" do
      it "thise should not be returned" 

    end
  end

  describe "#resolve_disabled" do
    it "returns list of features that are not given as parameter" 

  end
end

