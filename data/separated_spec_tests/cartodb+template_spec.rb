# encoding: utf-8

require_relative '../../../spec_helper_min'
require_relative '../../../../lib/carto/named_maps/template'

module Carto
  module NamedMaps
    describe Template do
      include Carto::Factories::Visualizations

      before(:each) do
        bypass_named_maps
      end

      before(:all) do
        @user = FactoryGirl.create(:carto_user, private_tables_enabled: true, private_maps_enabled: true)

        @map, _, _, @visualization = create_full_visualization(@user)

        @map.layers.reject(&:basemap?).each(&:destroy)
        @map.reload
      end

      describe '#to_hash' do
        after(:all) do
          destroy_full_visualization(@map1, @table1, @table_visualization1, @visualization1)
        end

        it 'should get view info from the map when the state center does not exist' 

      end

      describe '#name' do
        it 'should generate the template name correctly' 

      end

      it 'should have correct Named Maps version' 


      describe '#layers' do
        describe 'carto layers' do
          before(:all) do
            @carto_layer = FactoryGirl.create(:carto_layer, kind: 'carto', maps: [@map])
            @visualization.reload

            @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
          end

          after(:all) do
            @carto_layer.destroy
            @visualization.reload

            @template_hash = nil
          end

          it 'should generate placeholders' 


          it 'should have options' 


          it 'should be cartodb type' 


          it 'should contain layer id' 


          describe 'with popups' do
            let(:dummy_infowindow) do
              {
                "fields" => [
                  {
                    "name" => "click_status",
                    "title" => true,
                    "position" => 8
                  }],
                "template_name" => "table/views/infowindow_light",
                "template" => "",
                "alternative_names" => {},
                "width" => 226,
                "maxHeight" => 180
              }
            end

            let(:dummy_tooltip) do
              {
                "fields" => [
                  {
                    "name" => "hover_status",
                    "title" => true,
                    "position" => 8
                  }],
                "template_name" => "table/views/infowindow_light",
                "template" => "",
                "alternative_names" => {},
                "width" => 226,
                "maxHeight" => 180
              }
            end

            before(:all) do
              @carto_layer.options[:interactivity] = 'cartodb_id,click_status'
              @carto_layer.save

              @visualization.reload
            end

            after(:all) do
              @carto_layer.options[:interactivity] = nil
              @carto_layer.save

              @visualization.reload
            end

            describe 'triggered on hover only' do
              before(:all) do
                @carto_layer.tooltip = dummy_tooltip
                @carto_layer.save

                @visualization.reload

                template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
                @layer_options_hash = template_hash[:layergroup][:layers].second[:options]
              end

              after(:all) do
                @carto_layer.tooltip = nil
                @carto_layer.save

                @visualization.reload
                @layer_options_hash = nil
              end

              it 'interactivity contain fields but not cartodb_id' 


              it 'should not contain attributes' 

            end

            describe 'triggered onclick only' do
              before(:all) do
                @carto_layer.infowindow = dummy_infowindow
                @carto_layer.save

                @visualization.reload

                template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
                @layer_options_hash = template_hash[:layergroup][:layers].second[:options]
              end

              after(:all) do
                @carto_layer.infowindow = nil
                @carto_layer.save

                @visualization.reload
                @layer_options_hash = nil
              end

              it 'interactivity should only contain cartodb_id' 


              it 'should have attributes' 


              it 'attributes should have id: cartodb_id' 


              it 'attributes should contain correct columns' 

            end

            describe 'triggered onclick and onhover' do
              before(:all) do
                @carto_layer.infowindow = dummy_infowindow
                @carto_layer.tooltip = dummy_tooltip
                @carto_layer.save

                @visualization.reload

                template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
                @layer_options_hash = template_hash[:layergroup][:layers].second[:options]
              end

              after(:all) do
                @carto_layer.infowindow = nil
                @carto_layer.save

                @visualization.reload
                @layer_options_hash = nil
              end

              it 'interactivity should contain cartodb_id and selected columns' 


              it 'should have attributes' 


              it 'attributes should have id: cartodb_id' 


              it 'attributes should contain correct columns but not cartodb_id' 

            end
          end

          describe 'with aggregations' do
            before(:all) do
              @carto_layer.options[:query_wrapper] = 'SELECT manolo FROM (<%= sql %>)'
              @carto_layer.save
              @visualization.reload

              @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            end

            after(:all) do
              @carto_layer.options[:query_wrapper] = nil
              @carto_layer.save
              @visualization.reload
              @template_hash = nil
            end

            it 'should contain sql wrap' 

          end

          describe 'with analyses' do
            before(:all) do
              @analysis = FactoryGirl.create(:source_analysis, visualization_id: @visualization.id, user_id: @user.id)
              @visualization.reload

              @carto_layer.options[:source] = @analysis.natural_id
              @carto_layer.save
            end

            after(:all) do
              @analysis.destroy
              @carto_layer.options.delete(:source)
              @carto_layer.save
              @visualization.reload
              @template_hash = nil
            end

            describe 'and builder' do
              before(:all) do
                @visualization.stubs(:version).returns(3)
                @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
              end

              it 'should not contain sql' 


              it 'should contain source' 

            end

            describe 'and editor' do
              before(:all) do
                @visualization.stubs(:version).returns(2)
                @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
              end

              it 'should contain sql' 


              it 'should not contain source' 

            end
          end

          describe 'with no analyses' do
            before(:all) do
              @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            end

            after(:all) do
              @template_hash = nil
            end

            it 'should contain sql' 


            it 'should not contain source' 

          end
        end

        describe 'torque layers' do
          before(:all) do
            @torque_layer = FactoryGirl.create(:carto_layer, kind: 'torque', maps: [@map])
            @visualization.reload

            @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
          end

          after(:all) do
            @torque_layer.destroy
            @visualization.reload

            @template_hash = nil
          end

          it 'should generate placeholders' 


          it 'should have options' 


          it 'should be torque type' 


          it 'should contain layer id' 


          describe 'with aggregations' do
            before(:all) do
              @torque_layer.options[:query_wrapper] = 'SELECT manolo FROM (<%= sql %>)'
              @torque_layer.save
              @visualization.reload

              @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            end

            after(:all) do
              @torque_layer.options[:query_wrapper] = nil
              @torque_layer.save
              @visualization.reload
              @template_hash = nil
            end

            it 'should contain sql wrap' 


            it 'should not wrap sql' 

          end
        end

        describe 'basemap layers' do
          before(:all) do
            @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
          end

          after(:all) do
            @template_hash = nil
          end

          it 'should not generate placeholders' 


          it 'should have options' 


          it 'should be http type' 


          it 'should not have sql' 


          it 'should not have sql wrap' 


          it 'should not have source' 


          describe 'when basemap options' do
            before(:all) do
              @tms_layer = @visualization.layers.first
              @tms_layer.options[:tms] = true
              @tms_layer.options[:urlTemplate] = 'http://url_template_example'
              @tms_layer.options[:subdomains] = 'subdomains_example'

              @tms_layer.save
              @visualization.reload

              @tms_layer_hash = Carto::NamedMaps::Template.new(@visualization).to_hash[:layergroup][:layers][0]
            end

            after(:all) do
              @tms_layer = @visualization.layers.first
              @tms_layer.options[:tms] = nil
              @tms_layer.options[:urlTemplate] = nil
              @tms_layer.options[:subdomains] = nil

              @tms_layer.save
              @visualization.reload

              @tms_layer_hash = nil
            end

            it 'should have tms options' 


            it 'should have urlTemplate options' 


            it 'should have subdomains options' 

          end

          describe 'when background' do
            before(:all) do
              @background_layer = @visualization.layers.first

              @background_layer.options[:type] = 'plain'

              @background_layer.save
              @visualization.reload

              @background_layer_hash = Carto::NamedMaps::Template.new(@visualization).to_hash[:layergroup][:layers][0]
            end

            after(:all) do
              @background_layer = @visualization.layers.first

              @background_layer.options[:type] = 'plain'

              @background_layer.save
              @visualization.reload

              @background_layer_hash = nil
            end

            it 'should have options' 


            it 'should be http type' 

          end

          describe 'when google maps' do
            before(:all) do
              @gmaps_layer = @visualization.layers.first

              @gmaps_layer.options[:type] = 'gmapsbase'

              @gmaps_layer.save
              @visualization.reload

              @named_map_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            end

            it 'should not be included' 

          end
        end
      end

      describe '#auth' do
        describe 'when mapcaps exist' do
          before(:all) do
            @mapcap = Carto::Mapcap.create(visualization_id: @visualization.id)
            @regenerated_visualization = @visualization.latest_mapcap.regenerate_visualization
          end

          after(:all) do
            @mapcap.destroy
            @regenerated_visualization = nil
          end

          it 'should use non-mapcapped visualization for auth' 

        end

        describe 'should be open' do
          after(:each) do
            @visualization.save

            template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            template_hash[:auth][:method].should eq Carto::NamedMaps::Template::AUTH_TYPE_OPEN
          end

          it 'for public visualizations' 


          it 'for link visualizations' 

        end

        describe 'should be signed' do
          after(:each) do
            @visualization.save!

            template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
            template_hash[:auth][:valid_tokens].should_not be_empty
            template_hash[:auth][:method].should eq Carto::NamedMaps::Template::AUTH_TYPE_SIGNED
          end

          it 'for password protected visualizations' 


          it 'for organization private visualizations' 


          it 'for private visualizations' 


          describe 'and include tokens' do
            before(:all) do
              @org = mock
              @org.stubs(:get_auth_token).returns(SecureRandom.urlsafe_base64(nil, false))
              @group = mock
              @group.stubs(:get_auth_token).returns(SecureRandom.urlsafe_base64(nil, false))
              @other_user = mock
              @other_user.stubs(:get_auth_token).returns(SecureRandom.urlsafe_base64(nil, false))
            end

            before(:each) do
              @visualization.privacy = Carto::Visualization::PRIVACY_PRIVATE
              @visualization.stubs(:organization?).returns(true)
            end

            it 'for owner user always' 


            it 'for organization' 


            it 'for group' 


            it 'for other user' 


            it 'for multiple entities' 

          end
        end
      end

      describe '#layergroup' do
        before (:all) { @layergroup_hash = Carto::NamedMaps::Template.new(@visualization).to_hash[:layergroup] }
        after  (:all) { @layergroup_hash = nil }

        it 'should have version according to Map Config' 


        it 'should not have any dataview if no widgets are present' 


        it 'should not have any analysis if no analyses are present' 


        describe 'dataviews' do
          before(:all) do
            @carto_layer = FactoryGirl.create(:carto_layer, kind: 'carto', maps: [@map])
            @widget = FactoryGirl.create(:widget, layer: @carto_layer)
            @visualization.reload

            @dataview_hash = Carto::NamedMaps::Template.new(@visualization).to_hash[:layergroup][:dataviews]
            @template_widget = @dataview_hash[@widget.id]
          end

          after(:all) do
            @carto_layer.destroy
            @widget.destroy
            @visualization.reload

            @dataview_hash = nil
            @template_widget = nil
          end

          it 'should add dataviews if widgets are present' 


          it 'should add type correctly' 


          it 'should have only required options' 

        end

        describe '#analyses' do
          before(:all) do
            @analysis = FactoryGirl.create(:source_analysis, visualization_id: @visualization.id, user_id: @user.id)
            @visualization.reload

            @analysis_hash = Carto::NamedMaps::Template.new(@visualization).to_hash[:layergroup][:analyses].first
          end

          after(:all) do
            @analysis.destroy
            @visualization.reload

            @analysis_hash = nil
          end

          it 'should add analyses if analyses are present' 


          it 'should have the right definition' 

        end
      end

      describe '#view' do
        before(:each) do
          @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
        end

        it 'should contain map zoom' 


        it 'should contain center' 


        it 'should contain bounds' 


        describe 'it should use the state when it is present' do
          before do
            @visualization.state.json = {
              map: { ne: [-58.9, -143.9], sw: [37.4, 41.6], center: [-16.2, -51.1], zoom: 4 }
            }
            @template_hash = Carto::NamedMaps::Template.new(@visualization).to_hash
          end

          after do
            @visualization.state.json = {}
          end

          it 'should use the state info for the view when instantiating a named map' 


          it 'should not fail when invalid state' 

        end

        describe '#preview_layers' do
          before(:all) do
            @carto_layer = FactoryGirl.create(:carto_layer, kind: 'carto', maps: [@map])
            @visualization.reload

            template = Carto::NamedMaps::Template.new(@visualization)
            @preview_layers = template.to_hash[:view][:preview_layers]
          end

          after(:all) do
            @carto_layer.destroy
            @visualization.reload

            @preview_layers = nil
          end

          it 'should contain preview_layers' 


          it 'should not generate preview_layers for basemaps' 


          it 'should generate preview_layers correctly' 

        end
      end
    end
  end
end

