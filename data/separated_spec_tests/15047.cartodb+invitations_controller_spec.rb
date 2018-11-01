# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/user_creations_controller'
require_dependency 'carto/uuidhelper'

include Carto::UUIDHelper

describe Carto::Api::InvitationsController do
  include_context 'organization with users helper'

  describe 'create' do
    def post_api_v1_organization_invitations(user, invitation, organization_id = user.organization.id)
      invitation ||= {}
      post_json api_v1_organization_invitations_create_url(user_domain: user.username,
                                                           organization_id: organization_id,
                                                           api_key: user.api_key), invitation do |response|
        yield response
      end
    end

    it 'returns 404 for unknown organizations' 


    it 'returns 404 unless you are the owner of the organization' 


    let(:invitation) do
      {
        users_emails: ['email_a@carto.com', 'email_b@carto.com'],
        welcome_text: 'Please join my organization!',
        viewer: false
      }
    end

    it 'registers invitations with a token seed returning its json' 


    it 'registers invitations as an org admin' 


    it 'registers viewer invitations' 


    it 'fails if a user with any of the emails already exists' 

  end
end

