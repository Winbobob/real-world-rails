require 'spec_helper_min'
require 'carto_api/json_client'
require 'carto/data_library_service'

describe Carto::DataLibraryService do
  include_context 'users helper'

  let(:visualization_json) do
    "{\"id\":\"b7aa989a-d7bb-11e4-a982-0e43f3deba5a\",\"name\":\"meta_dataset\",\"display_name\":null," +
      "\"attributions\":null,\"source\":\"\",\"license\":\"\",\"type\":\"table\",\"tags\":[\"production\"]" +
      ",\"description\":\"This must be PUBLIC for \\\"Public Library\\\" to work correctly\"," +
      "\"created_at\":\"2015-03-31T15:36:36+00:00\",\"updated_at\":\"2015-05-29T14:49:45+00:00\"," +
      "\"title\":\"\",\"kind\":\"geom\",\"privacy\":\"PUBLIC\",\"likes\":0,\"liked\":false," +
      "\"permission\":{\"id\":\"da9b55a8-65d2-42a7-b30a-9847805fcb99\"," +
      "\"owner\":{\"id\":\"891c95dc-b1f3-47d2-ace0-12651259b811\",\"username\":\"common-data\"," +
      "\"name\":\"\",\"last_name\":null," +
      "\"avatar_url\":\"//wadus.net/cartodbui/assets/unversioned/images/avatars/avatar_mountain_green.png\"," +
      "\"base_url\":\"https://common-data.carto.com\",\"google_maps_query_string\":\"\"," +
      "\"disqus_shortname\":\"\",\"viewer\":false,\"org_admin\":false,\"org_user\":false,\"remove_logo\":true}}," +
      "\"stats\":{\"2018-02-08\":0,\"2018-02-09\":0,\"2018-02-10\":0,\"2018-02-11\":0,\"2018-02-12\":0," +
      "\"2018-02-13\":0,\"2018-02-14\":0,\"2018-02-15\":0,\"2018-02-16\":0,\"2018-02-17\":0,\"2018-02-18\":0," +
      "\"2018-02-19\":0,\"2018-02-20\":0,\"2018-02-21\":0,\"2018-02-22\":0,\"2018-02-23\":0,\"2018-02-24\":0," +
      "\"2018-02-25\":0,\"2018-02-26\":1.0,\"2018-02-27\":0,\"2018-02-28\":0,\"2018-03-01\":0,\"2018-03-02\":0," +
      "\"2018-03-03\":0,\"2018-03-04\":0,\"2018-03-05\":0,\"2018-03-06\":0,\"2018-03-07\":0,\"2018-03-08\":0," +
      "\"2018-03-09\":0},\"auth_tokens\":[],\"table\":{\"id\":\"bf8fa9a0-2000-4682-8f32-2334f9882ca3\"," +
      "\"name\":\"\\\"public\\\".meta_dataset\",\"permission\":{\"id\":\"da9b55a8-65d2-42a7-b30a-9847805fcb99\"," +
      "\"owner\":{\"id\":\"891c95dc-b1f3-47d2-ace0-12651259b811\",\"username\":\"common-data\",\"name\":\"\"," +
      "\"last_name\":null,\"avatar_url\":\"//wadus.net/cartodbui/assets/images/avatars/avatar_mountain_green.png\"," +
      "\"base_url\":\"https://common-data.carto.com\",\"google_maps_query_string\":\"\"," +
      "\"disqus_shortname\":\"\",\"viewer\":false,\"org_admin\":false,\"org_user\":false,\"remove_logo\":true}}," +
      "\"geometry_types\":[\"ST_MultiPolygon\"],\"privacy\":\"PUBLIC\",\"updated_at\":\"2015-05-14T10:30:31+00:00\", " +
      "\"size\":53248,\"row_count\":124}}"
  end

  describe '#load_dataset!' do
    it 'loads a remote dataset into a Data Library' 

  end

  let(:api_keys_response) do
    {
      total: 1,
      count: 1,
      result: [
        {
          name: "test_ro_untitled_table_39",
          user: { username: "juanignaciosl" },
          type: "regular",
          token: "z17KQqbcdbDfIYcD4FTw",
          grants: [
            { type: "apis", apis: ["maps", "sql"] },
            { type: "database", tables: [
              { schema: "juanignaciosl", name: "untitled_table_30", permissions: ["select"] }
            ] }
          ],
          created_at: "2018-03-23 14:45:00 +0000",
          updated_at: "2018-03-23 14:45:00 +0000",
          _links: { :self => "https://juanignaciosl.wcarto.com/api/v3/api_keys/test_ro_untitled_table_39" }
        }
      ],
      _links: {
        first: { :href => "https://juanignaciosl.wcarto.com/api/v3/api_keys?order=updated_at&page=1&per_page=100000" },
        last: { :href => "https://juanignaciosl.wcarto.com/api/v3/api_keys?order=updated_at&page=1&per_page=100000" }
      }
    }
  end

  describe '#load_datasets!' do
    it 'loads remote datasets from an API key into a Data Library' 

  end
end

