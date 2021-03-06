# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/layer_presenter'
require_relative '../../api/json/layer_presenter_shared_examples'

describe "Carto::Api::LayersController - Layer Model" do
  it_behaves_like 'layer presenters', Carto::Api::LayerPresenter, ::Layer
end

describe "Carto::Api::LayersController - Carto::Layer" do
  it_behaves_like 'layer presenters', Carto::Api::LayerPresenter, Carto::Layer
end

describe Carto::Api::LayerPresenter do
  def presenter_with_style_properties(layer)
    Carto::Api::LayerPresenter.new(layer, with_style_properties: true)
  end

  describe 'wizard_properties migration to style_properties' do
    def wizard_properties(type: 'polygon', properties: {})
      { "type" => type, 'properties' => properties }
    end

    def build_layer_with_wizard_properties(properties)
      FactoryGirl.build(:carto_layer, options: { 'wizard_properties' => properties })
    end

    it "doesn't autogenerate `style_properties` if `wizard_properties` isn't present but it's not requested" 


    it "autogenerates `style_properties` based on `wizard_properties` if it isn't present and it's requested" 


    it "autogenerates `style_properties` based on `wizard_properties` if it is present but autogenerated" 


    it "doesn't autogenerate `style_properties` based on `wizard_properties` if it is present and not autogenerated" 


    it "doesn't autogenerate `style_properties` if `wizard_properties` is not present or is empty" 


    it "doesn't autogenerate `style_properties` if type is not mapped" 


    describe 'options migration' do
      it 'migrates tile_style_custom to cartocss_custom (defaults to false)' 


      it 'migrates tile_style_history to cartocss_history (defaults to [])' 

    end

    describe 'simple' do
      it 'is generated from several types' 


      it 'does not have animated' 


      it 'has defaults for labels' 


      it 'defaults missing labels attributes' 

    end

    describe 'wizard migration' do
      COLOR = '#fabada'.freeze
      COLOR_1 = "#FACADA".freeze
      COLOR_2 = "#TACADA".freeze
      OPACITY = 0.3

      describe 'polygon' do
        describe 'polygon' do
          let(:marker_width) { 10 }
          let(:polygon_wizard_properties) do
            {
              "type" => "polygon",
              "properties" =>
                {
                  "marker-width" => marker_width,
                  "marker-fill" => "#FF6600",
                  "marker-opacity" => 0.9,
                  "marker-allow-overlap" => true,
                  "marker-placement" => "point",
                  "marker-type" => "ellipse",
                  "marker-line-width" => 1,
                  "marker-line-color" => "#FFF",
                  "marker-line-opacity" => 1,
                  "marker-comp-op" => "none",
                  "text-name" => "None",
                  "text-face-name" => "DejaVu Sans Book",
                  "text-size" => 10,
                  "text-fill" => "#000",
                  "text-halo-fill" => "#FFF",
                  "text-halo-radius" => 1,
                  "text-dy" => -10,
                  "text-allow-overlap" => true,
                  "text-placement-type" => "dummy",
                  "text-label-position-tolerance" => 0,
                  "text-placement" => "point",
                  "geometry_type" => "point"
                }
            }
          end

          it 'sets fill size from marker-width' 


          it 'ignores property' 

        end

        describe 'polygon-fill, marker-fill become "color fill" structure' do
          it 'setting opacity 1 if unknown' 


          it 'setting related opacity if known' 

        end
      end

      describe 'cluster' do
        let(:query_wrapper) { "with meta ... <%= sql %> ..." }
        let(:cluster_options) do
          {
            "query_wrapper" => query_wrapper,
            "wizard_properties" => {
              "type" => "cluster",
              "properties" => { "method" => "3 Buckets", "marker-fill" => "#FD8D3C" }
            }
          }
        end
        before(:each) do
          layer = FactoryGirl.build(:carto_layer, options: cluster_options)
          @options = presenter_with_style_properties(layer).to_poro['options']
          @properties = @options['style_properties']['properties']
        end

        it 'sets type simple and cartocss_custom to true' 


        it 'sets query_wrapper at sql_wrap' 


        it 'ignores property' 

      end

      describe 'bubble' do
        let(:property) { "actor_foll" }
        let(:quantile_function) { "Quantile" }
        let(:qfunction) { quantile_function }
        let(:radius_min) { 10 }
        let(:radius_max) { 25 }
        let(:marker_comp_op) { "multiply" }
        let(:bubble_wizard_properties) do
          {
            "type" => "bubble",
            "properties" =>
              {
                "property" => property,
                "qfunction" => qfunction,
                "radius_min" => radius_min,
                "radius_max" => radius_max,
                "marker-fill" => COLOR,
                "marker-opacity" => OPACITY,
                "marker-line-width" => 1,
                "marker-line-color" => "#FFF",
                "marker-line-opacity" => 1,
                "zoom" => 4,
                "geometry_type" => "point",
                "text-placement-type" => "simple",
                "text-label-position-tolerance" => 10,
                "marker-comp-op" => marker_comp_op
              }
          }
        end

        before(:each) do
          layer = build_layer_with_wizard_properties(bubble_wizard_properties)
          options = presenter_with_style_properties(layer).to_poro['options']
          @properties = options['style_properties']['properties']
          @fill_color = @properties['fill']['color']
          @fill_size = @properties['fill']['size']
        end

        it 'marker-comp-op becomes blending' 


        describe 'fill size' do
          it 'groups radius_min, radius_max into fill size range' 


          it 'property becomes attribute' 


          it 'bins is set to 10' 


          it 'qfunction becomes quantification, and Quantile is translated to quantiles' 


          it 'does not include animated' 

        end

        describe 'fill color' do
          it 'takes fixed color and opacity from marker-*' 

        end
      end

      describe 'choropleth' do
        let(:property) { "actor_foll" }
        let(:number_of_buckets) { 7 }
        let(:qfunction) { "Quantile" }
        let(:color_ramp) { "red" }
        let(:choropleth_wizard_properties) do
          {
            "type" => "choropleth",
            "properties" =>
              {
                "property" => property,
                "method" => "#{number_of_buckets} Buckets",
                "qfunction" => qfunction,
                "color_ramp" => color_ramp,
                "marker-opacity" => OPACITY,
                "marker-width" => 10,
                "marker-allow-overlap" => true,
                "marker-placement" => "point",
                "marker-type" => "ellipse",
                "marker-line-width" => 1,
                "marker-line-color" => "#FFF",
                "marker-line-opacity" => 1,
                "marker-comp-op" => "none",
                "zoom" => 4,
                "geometry_type" => "point"
              }
          }
        end

        before(:each) do
          layer = build_layer_with_wizard_properties(choropleth_wizard_properties)
          options = presenter_with_style_properties(layer).to_poro['options']
          @fill_color = options['style_properties']['properties']['fill']['color']
          @fill_size = options['style_properties']['properties']['fill']['size']
        end

        describe 'fill' do
          it 'has fixed size 10 by default' 


          it 'transform color_ramp to color array in range' 


          it 'property becomes attribute' 


          it 'method generates bins' 


          it 'qfunction becomes quantification, and Quantile is translated to quantiles' 


          it 'takes opacity from marker-* or polygon-*' 

        end
      end

      describe 'category' do
        let(:property) { "aforo" }
        let(:opacity) { 0.456 }
        let(:marker_line_width) { 1 }
        let(:marker_line_color) { "#FFF" }
        let(:marker_line_opacity) { 0.7 }
        let(:title_1) { 100 }
        let(:title_2) { 200 }
        let(:line_width) { 0.43 }
        let(:line_color) { "#FFA" }
        let(:line_opacity) { 0.91 }
        let(:category_wizard_properties) do
          {
            "type" => "category",
            "properties" => {
              "property" => property,
              "zoom" => "15",
              "geometry_type" => 'point',
              "text-placement-type" => "simple",
              "text-label-position-tolerance" => 10,
              "categories" => [
                {
                  "title" => title_1,
                  "title_type" => "number",
                  "color" => COLOR_1,
                  "value_type" => "color"
                },
                {
                  "title" => title_2,
                  "title_type" => "number",
                  "color" => COLOR_2,
                  "value_type" => "color"
                }
              ]
            }
          }
        end

        let(:marker_category_properties) do
          {
            "marker-width" => 10,
            "marker-opacity" => opacity,
            "marker-allow-overlap" => true,
            "marker-placement" => "point",
            "marker-type" => "ellipse",
            "marker-line-width" => marker_line_width,
            "marker-line-color" => marker_line_color,
            "marker-line-opacity" => marker_line_opacity
          }
        end

        let(:line_category_properties) do
          {
            "line-width" => line_width,
            "line-color" => line_color,
            "line-opacity" => line_opacity
          }
        end

        describe 'polygon geometry type' do
          before(:each) do
            properties = category_wizard_properties
            properties['properties']['geometry_type'] = 'polygon'
            properties['properties'].merge!(line_category_properties)
            layer = build_layer_with_wizard_properties(properties)
            @options = presenter_with_style_properties(layer).to_poro['options']
            @fill_color = @options['style_properties']['properties']['fill']['color']
            @fill_size = @options['style_properties']['properties']['fill']['size']
            @stroke_color = @options['style_properties']['properties']['stroke']['color']
            @stroke_size = @options['style_properties']['properties']['stroke']['size']
          end

          it 'sets "none" as default blending' 


          it 'line-width becomes fixed stroke size' 


          it 'line-color becomes fixed stroke color' 


          it 'line-opacity becomes opacity' 

        end

        describe 'point geometry type' do
          before(:each) do
            properties = category_wizard_properties
            properties['properties'].merge!(marker_category_properties)
            layer = build_layer_with_wizard_properties(properties)
            options = presenter_with_style_properties(layer).to_poro['options']
            @fill_color = options['style_properties']['properties']['fill']['color']
            @fill_size = options['style_properties']['properties']['fill']['size']
            @stroke_color = options['style_properties']['properties']['stroke']['color']
            @stroke_size = options['style_properties']['properties']['stroke']['size']
          end

          describe 'fill' do
            it 'has fill size fixed 10' 


            it 'generates not fixed color but range from categories colors' 


            it 'generates domain from titles' 


            it 'property becomes attribute' 


            it 'marker-opacity becomes opacity' 


            it 'bins defaults to 10' 

          end

          describe 'stroke' do
            it 'marker-line-width becomes fixed stroke size' 


            it 'marker-line-color becomes fixed stroke color' 


            it 'marker-line-opacity becomes opacity' 

          end
        end

        describe 'line geometry type' do
          before(:each) do
            properties = category_wizard_properties
            properties['properties'].merge!(line_category_properties)
            properties['properties']['geometry_type'] = 'line'
            layer = build_layer_with_wizard_properties(properties)

            options = presenter_with_style_properties(layer).to_poro['options']
            @stroke_color = options['style_properties']['properties']['stroke']['color']
            @stroke_size = options['style_properties']['properties']['stroke']['size']
          end

          it 'generates fixed size from line_width' 


          it 'generates color range from categories colors' 


          it 'property becomes attribute' 


          it 'line-width becomes fixed stroke size' 


          it 'line-color becomes fixed stroke color' 


          it 'line-opacity becomes opacity' 


          it 'bins defaults to 10' 


          describe 'stroke' do
            let(:line_width) { 6 }
            let(:line_color) { "#0F3B82" }
            let(:line_opacity) { 0.7 }
            let(:line_comp_op) { "none" }
            let(:simple_line_wizard_properties) do
              {
                "type" => "polygon",
                "geometry_type" => "line",
                "properties" =>
                  {
                    "line-width" => line_width,
                    "line-color" => line_color,
                    "line-opacity" => line_opacity,
                    "line-comp-op" => line_comp_op,
                    "geometry_type" => "line"
                  }
              }
            end

            before(:each) do
              layer = build_layer_with_wizard_properties(simple_line_wizard_properties)
              options = presenter_with_style_properties(layer).to_poro['options']
              @properties = options['style_properties']['properties']
              @stroke = @properties['stroke']
              @stroke_color = @stroke['color']
              @stroke_size = @stroke['size']
            end

            it 'generates stroke' 

          end
        end
      end

      shared_examples_for 'torque wizard family' do
        describe 'animated' do
          it 'property becomes attribute' 


          it 'property becomes attribute only at animated' 


          it 'torque-duration becomes duration' 


          it 'torque-frame-count becomes steps' 


          it 'torque-resolution becomes resolution' 


          it 'torque-trails becomes trails' 


          it "doesn't include redundant animated enabled option" 

        end
      end

      shared_examples_for 'torque blend wizard family' do
        describe 'torque-blend-mode' do
          it 'becomes blending' 

        end
      end

      shared_examples_for 'torque animated family' do
        it_behaves_like 'torque wizard family'

        it 'type is animated' 


        it 'generates a timeseries widget' 

      end

      describe 'torque' do
        it_behaves_like 'torque animated family'
        it_behaves_like 'torque blend wizard family'

        let(:torque_blend_mode) { "lighter" }
        let(:property) { "fecha_date" }
        let(:marker_width) { 6 }
        let(:torque_cumulative) { false }
        let(:torque_duration) { 30 }
        let(:torque_frame_count) { 256 }
        let(:torque_resolution) { 2 }
        let(:torque_trails) { 3 }
        let(:torque_wizard_properties) do
          {
            "type" => "torque",
            "properties" =>
              {
                "torque-cumulative" => torque_cumulative,
                "property" => property,
                "marker-type" => "ellipse",
                "layer-type" => "torque",
                "marker-width" => marker_width,
                "marker-fill" => "#0F3B82",
                "marker-opacity" => 0.9,
                "marker-line-width" => 0,
                "marker-line-color" => "#FFF",
                "marker-line-opacity" => 1,
                "torque-duration" => torque_duration,
                "torque-frame-count" => torque_frame_count,
                "torque-blend-mode" => torque_blend_mode,
                "torque-trails" => torque_trails,
                "torque-resolution" => torque_resolution,
                "zoom" => 15,
                "geometry_type" => "point"
              }
          }
        end

        before(:each) do
          @layer = build_layer_with_wizard_properties(torque_wizard_properties)
          options = presenter_with_style_properties(@layer).to_poro['options']
          @style = options['style_properties']
          @properties = @style['properties']
          @animated = @properties['animated']
          @fill = @properties['fill']
          @fill_color = @fill['color']
          @fill_size = @fill['size']
        end

        it 'torque-cumulative becomes overlap' 


        it 'marker-width becomes fill size fixed' 


        describe 'torque-blend-mode' do
          it 'turns source-over into src-over' 

        end
      end
    end

    describe 'torque cat' do
      it_behaves_like 'torque animated family'
      it_behaves_like 'torque blend wizard family'

      let(:torque_blend_mode) { "lighter" }
      let(:property) { "fecha_date" }
      let(:property_cat) { "aforo" }
      let(:torque_duration) { 30 }
      let(:torque_frame_count) { 256 }
      let(:torque_resolution) { 2 }
      let(:torque_trails) { 3 }
      let(:torque_cat_wizard_properties) do
        {
          "type" => "torque",
          "properties" =>
            {
              "property" => property,
              "marker-type" => "ellipse",
              "layer-type" => "torque",
              "property_cat" => property_cat,
              "marker-width" => 6,
              "marker-fill" => "#0F3B82",
              "marker-opacity" => 0.9,
              "marker-line-width" => 0,
              "marker-line-color" => "#FFF",
              "marker-line-opacity" => 1,
              "torque-duration" => torque_duration,
              "torque-frame-count" => torque_frame_count,
              "torque-blend-mode" => torque_blend_mode,
              "torque-trails" => torque_trails,
              "torque-resolution" => torque_resolution,
              "zoom" => 15,
              "geometry_type" => "point",
              "categories" => [
                {
                  "title" => 100,
                  "title_type" => "number",
                  "color" => COLOR_1,
                  "value_type" => "color"
                },
                {
                  "title" => 200,
                  "title_type" => "number",
                  "color" => COLOR_2,
                  "value_type" => "color"
                }
              ]
            }
        }
      end

      before(:each) do
        @layer = build_layer_with_wizard_properties(torque_cat_wizard_properties)
        options = presenter_with_style_properties(@layer).to_poro['options']
        @style = options['style_properties']
        @properties = @style['properties']
        @animated = @properties['animated']
        @fill = @properties['fill']
        @fill_color = @fill['color']
        @fill_size = @fill['size']
      end

      it 'generates color range from categories colors' 


      it 'generates color range based on attribute' 

    end

    describe 'density' do
      let(:query_wrapper) { "with meta ... <%= sql %> ..." }
      let(:color_ramp) { "red" }
      let(:polygon_size) { 15 }
      let(:density_wizard_properties) do
        {
          "type" => "density",
          "properties" =>
            {
              "geometry_type" => "point",
              "method" => "5 Buckets",
              "color_ramp" => color_ramp,
              "polygon-opacity" => 0.8,
              "line-width" => 0.5,
              "line-color" => "#FFF",
              "line-opacity" => 1,
              "polygon-size" => polygon_size,
              "polygon-comp-op" => "none",
              "zoom" => 15
            }
        }
      end

      before(:each) do
        options = { 'query_wrapper' => query_wrapper, 'wizard_properties' => density_wizard_properties }
        layer = FactoryGirl.build(:carto_layer, options: options)
        @options = presenter_with_style_properties(layer).to_poro['options']

        @style = @options['style_properties']
        @properties = @style['properties']
        @aggregation = @properties['aggregation']
        @fill_color = @properties['fill']['color']
        @stroke = @properties['stroke']
      end

      it 'sets query_wrapper at sql_wrap' 


      it 'maps point geometry_type to hexabins type' 


      it 'maps Rectangles geometry_type to squares type' 


      describe 'aggregation' do
        it 'has defaults' 


        it 'takes size from polygon-size' 

      end

      describe 'fill' do
        it 'transform color_ramp to color range' 

      end

      describe 'stroke' do
        it 'takes width from line-width' 


        it 'takes color from line-color' 


        it 'takes opacity from line-opacity' 

      end
    end

    describe 'heatmap' do
      shared_examples_for 'heatmap' do
        describe 'aggregation' do
          before(:each) do
            @aggregation = @style['properties']['aggregation']
          end

          it 'takes size from torque-resolution' 


          it 'has COUNT for value operator and empty string for attribute' 

        end

        describe 'properties' do
          before(:each) do
            @properties = @style['properties']
          end

          describe 'fill' do
            it 'has size fixed 35' 


            describe 'color' do
              before(:each) do
                @color = @fill['color']
              end

              it "has attribute: points_agg, default range color array, bins: 6 and opacity from marker_opacity" 

            end
          end
        end
      end

      let(:heatmap_wizard_properties) do
        { "type" => "torque_heat",
          "properties" =>
            {
              "marker-width" => 35,
              "layer-type" => "torque",
              "marker-file" => "url(http://s3.amazonaws.com/com.cartodb.assets.static/alphamarker.png)",
              "image-filters" => "colorize-alpha(blue, cyan, lightgreen, yellow , orange, red)",
              "marker-opacity" => marker_opacity,
              "heat-animated" => animated,
              "torque-cumulative" => false,
              "property" => property,
              "torque-duration" => torque_duration,
              "torque-frame-count" => torque_frame_count,
              "torque-trails" => torque_trails,
              "torque-resolution" => torque_resolution,
              "zoom" => 3,
              "geometry_type" => "point",
              "text-placement-type" => "simple",
              "text-label-position-tolerance" => 10
            }
          }
      end

      before(:each) do
        @layer = build_layer_with_wizard_properties(heatmap_wizard_properties)
        options = presenter_with_style_properties(@layer).to_poro['options']

        @style = options['style_properties']
        @properties = @style['properties']
        @animated = @properties['animated']
        @fill = @properties['fill']
        @fill_color = @fill['color']
        @fill_size = @fill['size']
      end

      describe 'animated' do
        let(:torque_resolution) { 8 }
        let(:marker_opacity) { 0.4 }
        let(:torque_trails) { 2 }
        let(:torque_frame_count) { 32 }
        let(:torque_duration) { 10 }
        let(:property) { "actor_post" }
        let(:animated) { true }

        it_behaves_like 'torque animated family'
        it_behaves_like 'heatmap'
      end

      describe 'without animation' do
        let(:torque_resolution) { 8 }
        let(:marker_opacity) { 0.4 }
        let(:torque_trails) { 2 }
        let(:torque_frame_count) { 1 }
        let(:torque_duration) { 10 }
        let(:property) { "cartodb_id" }
        let(:animated) { false }

        it 'is generated from torque_heat' 


        it_behaves_like 'torque wizard family'
        it_behaves_like 'heatmap'
      end
    end

    describe 'labels' do
      describe 'without text-* properties' do
        let(:no_text_wizard_properties) do
          {
            "type" => "choropleth",
            "properties" => { "property" => 'actor_foll' }
          }
        end

        it 'generates disabled labels' 

      end

      describe 'with text-name `None`' do
        let(:none_text_name_wizard_properties) do
          {
            "type" => "choropleth",
            "properties" =>
              {
                "text-name" => 'None',
                "text-face-name" => 'something'
              }
          }
        end

        it 'generates disabled labels' 

      end

      describe 'with text-* properties' do
        let(:text_name) { "Something" }
        let(:text_face_name) { "DejaVu Sans Book" }
        let(:text_size) { 10 }
        let(:text_fill) { "#000" }
        let(:text_halo_radius) { 1 }
        let(:text_halo_fill) { "#ABC" }
        let(:text_dy) { -10 }
        let(:text_allow_overlap) { true }
        let(:text_placement_type) { "simple" }
        let(:text_wizard_properties) do
          {
            "type" => "choropleth",
            "properties" =>
              {
                "text-name" => text_name,
                "text-face-name" => text_face_name,
                "text-size" => text_size,
                "text-fill" => text_fill,
                "text-halo-fill" => text_halo_fill,
                "text-halo-radius" => text_halo_radius,
                "text-dy" => text_dy,
                "text-allow-overlap" => text_allow_overlap,
                "text-placement-type" => text_placement_type,
                "text-label-position-tolerance" => 10,
                "text-placement" => "point"
              }
          }
        end

        before(:each) do
          layer = build_layer_with_wizard_properties(text_wizard_properties)
          options = presenter_with_style_properties(layer).to_poro['options']
          @labels = options['style_properties']['properties']['labels']
        end

        it 'generates labels' 


        it 'text-name generates attribute' 


        it 'text-name `None` generates `nil` attribute' 


        it 'text-face-name generates font' 


        it 'text-dy generates offset' 


        it 'text-allow-overlap generates overlap' 


        it 'text-placement-type generates placement' 


        describe 'fill' do
          before(:each) do
            @labels_fill = @labels['fill']
            @labels_fill.should_not be_nil
            @labels_fill_size = @labels_fill['size']
            @labels_fill_color = @labels_fill['color']
          end

          it 'text-size generates fill size fixed' 


          it 'text-fill generates fill color fixed and opacity 1 if not present' 


          it 'text-fill generates fill color fixed and opacity if present' 

        end

        describe 'halo' do
          before(:each) do
            @labels_halo = @labels['halo']
            @labels_halo.should_not be_nil
            @labels_halo_size = @labels_halo['size']
            @labels_halo_color = @labels_halo['color']
          end

          it 'text-halo-radius generates halo size fixed' 


          it 'text-halo-fill generates halo color fixed and opacity 1 if not present' 


          it 'text-halo-fill generates fill color fixed and opacity if present' 

        end
      end
    end
  end
end

