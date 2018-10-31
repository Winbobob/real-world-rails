# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '.././../../factories/organizations_contexts'
require_relative '.././../../factories/visualization_creation_helpers'
require_relative '../../../../app/controllers/carto/api/grantables_controller'

describe Carto::Api::GrantablesController do
  include_context 'organization with users helper'

  def count_grantables(organization)
    organization.users.length + organization.groups.length
  end

  describe 'Grantables', :order => :defined do

    before(:all) do
      @headers = { 'CONTENT_TYPE' => 'application/json', :format => "json", 'Accept' => 'application/json' }
    end

    it "Throws 401 error without http auth" 


    describe "#index", :order => :defined do

      it "returns all organization users as a grantable of type user with avatar_url" 


      it "returns all organization users and groups as a grantable of the right type, including additional information" 


      it "can paginate results" 


      it "can order by type" 


      it 'can filter by name' 


      it 'filter by name with special characters uses them as literals' 


      it "validates order param" 

    end

  end
end

