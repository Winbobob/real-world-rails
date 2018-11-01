#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require_relative '../spec_helper'

describe LoginController do
  describe "#new" do
    it "redirects to dashboard if already logged in" 


    it "should set merge params correctly in the session" 


    it "respects auth_discovery_url" 


    it "passes delegated message on to discovery url" 


    it "handles legacy canvas_login=1 param" 


    it "handles legacy SAML AAC-specific :id" 


    it "redirects to Canvas auth by default" 


    it "redirects to CAS if it's the default" 


    it "redirects to Facebook if it's the default" 


    it "redirects based on authentication_provider param" 


    it "redirects based on authentication_provider id param" 


    it "should pass pseudonym_session[unique_id] to redirect to populate username textbox" 


    it "should pass pseudonym_session[unique_id] to redirect from current username" 


    context 'given an html request' do
      before { get :new, format: :html }

      it 'response with an html content type' 

    end

    context 'given a pdf request' do
      before { get :new, format: :pdf }

      it 'response with an html content type' 

    end
  end

  describe "#logout" do
    it "doesn't logout if the authenticity token is invalid" 


    it "logs out" 


    it "follows SAML logout redirect to IdP" 


    it "follows CAS logout redirect to CAS server" 


    it "returns you to Canvas login if you logged in via Canvas, but something else is the primary provider" 

  end

  describe "#logout_landing" do
    it "redirects to /login if not logged in" 


    it "renders logout landing if just logged out" 


    it "renders if you are logged in" 

  end
end

