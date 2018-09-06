# encoding: utf-8

require 'spec_helper_min'

module Carto
  module Styles
    describe Polygon do
      describe '#default' do
        let(:production_default_polygon_cartocss) do
          "#layer {\n"\
          "  polygon-fill: #826DBA;\n"\
          "  polygon-opacity: 0.9;\n"\
          "  ::outline {\n"\
          "    line-color: #FFFFFF;\n"\
          "    line-width: 1;\n"\
          "    line-opacity: 0.5;\n"\
          "  }\n"\
          "}"
        end

        it 'has stayed the same' 

      end
    end
  end
end
