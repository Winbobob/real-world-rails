# encoding: utf-8

require 'spec_helper_min'

module Carto
  module Styles
    module Presenters
      describe CartoCSS do
        before (:all) { @presenter_class = Carto::Styles::Presenters::CartoCSS }
        after  (:all) { @presenter_class = nil }

        let(:empty_cartocss) do
          "#layer {\n"\
          "\n"\
          "}"
        end

        let(:cartocss_array) do
          ["color-camisa: blanco;",
           "talla-zapatos: 46;",
           "altura: 186cm;"]
        end

        let(:cartocss) do
          "#layer {\n"\
          "  color-camisa: blanco;\n"\
          "  talla-zapatos: 46;\n"\
          "  altura: 186cm;\n"\
          "}"
        end

        it 'returns empty cartocss when no params specified' 


        it 'returns empty cartocss when empty cartocss array is provided' 


        it 'respects provided class name' 


        it 'returns properties formatted' 

      end
    end
  end
end

