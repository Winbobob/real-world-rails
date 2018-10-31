require 'spec_helper'

describe API::Features do
  set(:user)  { create(:user) }
  set(:admin) { create(:admin) }

  before do
    Flipper.unregister_groups
    Flipper.register(:perf_team) do |actor|
      actor.respond_to?(:admin) && actor.admin?
    end
  end

  describe 'GET /features' do
    let(:expected_features) do
      [
        {
          'name' => 'feature_1',
          'state' => 'on',
          'gates' => [{ 'key' => 'boolean', 'value' => true }]
        },
        {
          'name' => 'feature_2',
          'state' => 'off',
          'gates' => [{ 'key' => 'boolean', 'value' => false }]
        },
        {
          'name' => 'feature_3',
          'state' => 'conditional',
          'gates' => [
            { 'key' => 'boolean', 'value' => false },
            { 'key' => 'groups', 'value' => ['perf_team'] }
          ]
        }
      ]
    end

    before do
      Feature.get('feature_1').enable
      Feature.get('feature_2').disable
      Feature.get('feature_3').enable Feature.group(:perf_team)
    end

    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it 'returns the feature list for admins' 

  end

  describe 'POST /feature' do
    let(:feature_name) { 'my_feature' }

    context 'when the feature does not exist' do
      it 'returns a 401 for anonymous users' 


      it 'returns a 403 for users' 


      context 'when passed value=true' do
        it 'creates an enabled feature' 


        it 'creates an enabled feature for the given Flipper group when passed feature_group=perf_team' 


        it 'creates an enabled feature for the given user when passed user=username' 


        it 'creates an enabled feature for the given user and feature group when passed user=username and feature_group=perf_team' 

      end

      it 'creates a feature with the given percentage if passed an integer' 

    end

    context 'when the feature exists' do
      let(:feature) { Feature.get(feature_name) }

      before do
        feature.disable # This also persists the feature on the DB
      end

      context 'when passed value=true' do
        it 'enables the feature' 


        it 'enables the feature for the given Flipper group when passed feature_group=perf_team' 


        it 'enables the feature for the given user when passed user=username' 

      end

      context 'when feature is enabled and value=false is passed' do
        it 'disables the feature' 


        it 'disables the feature for the given Flipper group when passed feature_group=perf_team' 


        it 'disables the feature for the given user when passed user=username' 

      end

      context 'with a pre-existing percentage value' do
        before do
          feature.enable_percentage_of_time(50)
        end

        it 'updates the percentage of time if passed an integer' 

      end
    end
  end

  describe 'DELETE /feature/:name' do
    let(:feature_name) { 'my_feature' }

    context 'when the user has no access' do
      it 'returns a 401 for anonymous users' 


      it 'returns a 403 for users' 

    end

    context 'when the user has access' do
      it 'returns 204 when the value is not set' 


      context 'when the gate value was set' do
        before do
          Feature.get(feature_name).enable
        end

        it 'deletes an enabled feature' 

      end
    end
  end
end

