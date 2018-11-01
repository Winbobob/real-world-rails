# encoding: utf-8
require_relative '../../../lib/importer/url_translator/fusion_tables'

include CartoDB::Importer2

describe UrlTranslator::FusionTables do
  url1  = "https://www.google.com/fusiontables/DataSource?" +
          "docid=1dimNIKKwROG1yTvJ6JlMm4-B4LxMs2YbncM4p9g#map:id=3"
  url2  = "https://www.google.com/fusiontables/data?" +
          "docid=1G0S0PVX2lD39uY6VC4VwYy2dbGGh8uHNG9bPxng#map:id=3"
  url2_translation = "https://www.google.com/fusiontables/"  +
                        "exporttable?query=select+*+from+"      +
                        "1G0S0PVX2lD39uY6VC4VwYy2dbGGh8uHNG9bPxng"
  url2_without_map_id  = "https://www.google.com/fusiontables/data?" +
          "docid=1G0S0PVX2lD39uY6VC4VwYy2dbGGh8uHNG9bPxng"

  url2_without_docid  = "https://www.google.com/fusiontables/data?" +
          "nodocid=1G0S0PVX2lD39uY6VC4VwYy2dbGGh8uHNG9bPxng"

  # INFO: this is the URL where url_with_query kind of URLs are redirected to
  url_with_content = 'https://fusiontables.googleusercontent.com/fusiontables/embedviz?' +
      'viz=GVIZ&t=TABLE&q=select+col1,+col2,+col3+from+' +
      '17aT9Ud-YnGiXdXEJUyycH2ocUqreOeKGbzCkUw+where+col1+in+' +
      '(%27Minnesota%27,+%27Mississippi%27)&containerId=googft-gviz-canvas'

  url_with_query = 'https://www.google.com/fusiontables/embedviz?' +
      'viz=GVIZ&t=TABLE&q=select+col1%2C+col2%2C+col3+' +
      'from+17aT9Ud-YnGiXdXEJUyycH2ocUqreOeKGbzCkUw+where+col1+' +
      "in+('Minnesota'%2C+'Mississippi')&containerId=googft-gviz-canvas"
  url_with_query_translation = 'https://www.google.com/fusiontables/' +
      'exporttable?query=select+col1%2C+col2%2C+col3+' +
      'from+17aT9Ud-YnGiXdXEJUyycH2ocUqreOeKGbzCkUw+where+col1+' +
      "in+('Minnesota'%2C+'Mississippi')"

  url_with_query_without_container_id = 'https://www.google.com/fusiontables/embedviz?' +
      'viz=GVIZ&t=TABLE&q=select+col1%2C+col2%2C+col3+' +
      'from+17aT9Ud-YnGiXdXEJUyycH2ocUqreOeKGbzCkUw+where+col1+' +
      "in+('Minnesota'%2C+'Mississippi')"

  describe '#translate' do
    it 'returns a translated Fusion Tables url' 


    it 'returns the url if already translated' 


    it 'returns the url if not supported' 


    it 'translates url table query' 

  end #translate

  describe '#supported?' do
    it 'returns true if URL is from Fusion Tables and has docid' 


    it 'returns false if url does not contain docid' 


    it 'returns false for user content' 


    it 'returns true with table query' 


  end #supported?

  describe '#translated?' do
    it 'returns true if URL already translated' 

  end #translated?
end # UrlTranslator::Fusion Tables


