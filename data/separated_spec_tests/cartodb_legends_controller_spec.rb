# encoding: utf-8

require 'spec_helper_min'
require 'support/helpers'
require 'factories/carto_visualizations'

module Carto
  module Api
    describe Carto::Api::LegendsController do
      include Carto::Factories::Visualizations, HelperMethods

      let(:category_legend_payload) do
        {
          pre_html: "<h3>Es acaso</h3>",
          post_html: "<h3>el mejor artista del mundo?</h3>",
          title: "La verdad",
          type: "category",
          conf: {
            columns: ['manolo', 'escobar']
          },
          definition: {}
        }
      end

      let(:custom_legend_payload) do
        {
          pre_html: "<h3>Es acaso</h3>",
          post_html: "<h3>el mejor artista del mundo?</h3>",
          title: "La verdad",
          type: "custom",
          conf: {
            columns: ['manolo', 'escobar']
          },
          definition: {
            categories: [
              { title: 'Manolo Escobar' },
              { title: 'Manolo Escobar', color: '#fff' },
              { title: 'Manolo Escobar', icon: 'super.png' },
              { title: 'Manolo Escobar', icon: 'super.png', color: '#FFF' }
            ]
          }
        }
      end

      let(:bubble_legend_payload) do
        {
          pre_html: "<h3>Es acaso</h3>",
          post_html: "<h3>el mejor artista del mundo?</h3>",
          title: "La verdad",
          type: "bubble",
          conf: {
            columns: ['manolo', 'escobar']
          },
          definition: {
            color: '#fff'
          }
        }
      end

      let(:choropleth_legend_payload) do
        {
          pre_html: "<h3>Es acaso</h3>",
          post_html: "<h3>el mejor artista del mundo?</h3>",
          title: "La verdad",
          type: "choropleth",
          conf: {
            columns: ['manolo', 'escobar']
          },
          definition: {
            prefix: "123",
            suffix: "foo"
          }
        }
      end

      let(:custom_choropleth_legend_payload) do
        {
          pre_html: "<h3>Es acaso</h3>",
          post_html: "<h3>el mejor artista del mundo?</h3>",
          title: "La verdad",
          type: "custom_choropleth",
          conf: {
            columns: ['manolo', 'escobar']
          },
          definition: {
            prefix: "123",
            suffix: "foo",
            colors: [
              { color: '#fff' },
              { color: '#fabada' },
              { color: '#CCC' }
            ]
          }
        }
      end

      let(:fake_uuid) { 'aaaaaaaa-0000-bbbb-1111-cccccccccccc' }

      before(:all) do
        @user = FactoryGirl.create(:carto_user)
        @intruder = FactoryGirl.create(:carto_user)
        @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
        @layer = @visualization.data_layers.first
      end

      after(:all) do
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
        @user.destroy
        @intruder.destroy
        @layer = nil
      end

      before(:each) do
        bypass_named_maps
      end

      def legend_is_correct(legend)
        legend = legend.deep_symbolize_keys
        saved_legend = LegendPresenter.new(Legend.find(legend[:id])).to_hash

        pruned_legend = prune_legend(legend)
        pruned_saved_legend = prune_legend(saved_legend)

        legend_definition = legend[:definition].with_indifferent_access
        saved_legend_definition = saved_legend[:definition]
                                  .with_indifferent_access

        conf = legend[:conf].with_indifferent_access
        saved_conf = saved_legend[:conf].with_indifferent_access

        pruned_legend.should eq pruned_saved_legend
        legend_definition.should eq saved_legend_definition
        conf.should eq saved_conf
      end

      def prune_legend(legend)
        legend.except(:created_at, :updated_at, :definition, :conf)
      end

      describe '#create' do
        after(:each) { @layer.reload.legends.map(&:destroy) }

        def create_legend_url(user: @user, visualization: @visualization, layer: @layer)
          legends_url(user_domain: user.subdomain,
                      visualization_id: visualization.id,
                      layer_id: layer.id,
                      api_key: user.api_key)
        end

        it 'should reject non visualization owners' 


        it 'should reject non data layers' 


        it 'should return a validation errors' 


        describe 'with valid definitions' do
          after(:each) do
            post_json create_legend_url, @payload do |response|
              response.status.should eq 201

              legend_is_correct(response.body)
            end
          end

          after(:all) do
            @payload = nil
          end

          it 'for category' 


          it 'for custom' 


          it 'for bubble' 


          it 'for choropleth' 


          it 'for custom_choropleth' 

        end

        describe 'with spammy definitions' do
          after(:each) do
            spammy_definition = @payload[:definition].merge(spam: 'hell')
            @payload[:definition] = spammy_definition

            post_json create_legend_url, @payload do |response|
              response.status.should eq 422
            end
          end

          after(:all) do
            @payload = nil
          end

          it 'banned for category' 


          it 'banned for custom' 


          it 'banned for bubble' 


          it 'banned for choropleth' 


          it 'banned for custom_choropleth' 

        end

        describe 'with spammy conf' do
          after(:each) do
            spammy_definition = @payload[:conf].merge(spam: 'hell')
            @payload[:conf] = spammy_definition

            post_json create_legend_url, @payload do |response|
              response.status.should eq 422
            end
          end

          after(:all) do
            @payload = nil
          end

          it 'banned for category' 


          it 'banned for custom' 


          it 'banned for bubble' 


          it 'banned for choropleth' 


          it 'banned for custom_choropleth' 

        end

        describe 'with wrong conf type' do
          after(:each) do
            @payload[:conf] = { columns: { not: 'an_array' } }

            post_json create_legend_url, @payload do |response|
              response.status.should eq 422
            end
          end

          after(:all) do
            @payload = nil
          end

          it 'banned for category' 


          it 'banned for custom' 


          it 'banned for bubble' 


          it 'banned for choropleth' 


          it 'banned for custom_choropleth' 

        end

        describe 'with wrong conf columns type' do
          after(:each) do
            @payload[:conf] = ['manolo', 'escobar', 2]

            post_json create_legend_url, @payload do |response|
              response.status.should eq 422
            end
          end

          after(:all) do
            @payload = nil
          end

          it 'banned for category' 


          it 'banned for custom' 


          it 'banned for bubble' 


          it 'banned for choropleth' 


          it 'banned for custom_choropleth' 

        end

        it 'handles bad layer_id' 


        it 'handles bad visualization_id' 


        describe 'multiple legends per layer' do
          it 'can create a color layer and a size layer' 


          it 'cannot create two color layers' 


          it 'cannot create two size layers' 

        end
      end

      describe '#show' do
        before (:all) { @legend = Legend.create!(custom_legend_payload.merge(layer_id: @layer.id)) }
        after  (:all) { @legend.destroy }

        def show_legend_url(user: @user, visualization: @visualization, layer: @layer, legend: @legend)
          legend_url(user_domain: user.subdomain,
                     visualization_id: visualization.id,
                     layer_id: layer.id,
                     id: legend.id,
                     api_key: user.api_key)
        end

        it 'should show a legend' 


        it 'should not show a legend to others' 


        it 'handles bad legend_id' 

      end

      describe '#update' do
        before (:all) { @legend = Legend.create!(custom_legend_payload.merge(layer_id: @layer.id)) }
        after  (:all) { @legend.destroy }

        def update_legend_url(user: @user, visualization: @visualization, layer: @layer, legend: @legend)
          legend_url(user_domain: user.subdomain,
                     visualization_id: visualization.id,
                     layer_id: layer.id,
                     id: legend.id,
                     api_key: user.api_key)
        end

        it 'updates a legend' 


        it 'updates a legend when max legends reached' 


        it 'should let others update a legend' 


        it 'handles bad legend_id' 

      end

      describe '#index' do
        before(:all) do
          @layer.reload.legends.map(&:destroy)
          Legend.create!(custom_legend_payload.merge(layer_id: @layer.id))
          Legend.create!(bubble_legend_payload.merge(layer_id: @layer.id))
        end

        after(:all) do
          @layer.reload.legends.map(&:destroy)
        end

        def index_legend_url(user: @user, visualization: @visualization, layer: @layer)
          legends_url(user_domain: user.subdomain,
                      visualization_id: visualization.id,
                      layer_id: layer.id,
                      api_key: user.api_key)
        end

        it 'indexes legends' 


        it 'should not index legends to others' 

      end

      describe '#delete' do
        before (:each) { @legend = Legend.create!(custom_legend_payload.merge(layer_id: @layer.id)) }
        after  (:each) { @legend.destroy }

        def delete_legend_url(user: @user, visualization: @visualization, layer: @layer, legend: @legend)
          legend_url(user_domain: user.subdomain,
                     visualization_id: visualization.id,
                     layer_id: layer.id,
                     id: legend.id,
                     api_key: user.api_key)
        end

        it 'should delete a legend' 


        it 'should not delete another user\'s legend' 


        it 'handles bad legend_id' 

      end
    end
  end
end

