#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe AvatarHelper do
  include AvatarHelper

  context "avatars" do
    let_once(:user) {user_model(short_name: "test user")}
    let(:services) {{avatars: true}}
    let(:avatar_size) {50}
    let(:request) { ActionDispatch::Request.new(Rack::MockRequest.env_for("http://test.host/")) }

    def service_enabled?(type)
      services[type]
    end

    describe ".avatar_image_attrs" do
      it "accepts a user id" 


      it "accepts a user" 


      it "falls back to blank avatar when given a user id of 0" 


      it "falls back to blank avatar when user's avatar has been reported during this session" 


      it "falls back to a blank avatar when the user is nil" 

    end

    describe ".avatar" do
      let_once(:user) {user_model(short_name: 'Greta')}

      it "leaves off the href and creates a span if url is nil" 


      it "sets the href to the given url" 


      it "links to the context user's page when given a context_code" 


      it "links to the user's page" 


      it "falls back to a blank avatar when the user is nil" 


      it 'includes screenreader content if supplied' 


      it 'defaults the screenreader content to just the display name if sr_content is not supplied' 

    end

    describe ".avatar_url_for_user" do
      before(:once) do
        Account.default.tap { |a| a.enable_service(:avatars); a.save! }
      end

      it "returns a fallback avatar if the user doesn't have one" 


      it "returns null if use_fallback is false" 


      it "returns null if params[no_avatar_fallback] is set" 


      it "returns a frd avatar url if one exists" 

    end

    context "with avatar service off" do
      let(:services) {{avatars: false}}

      it "should return full URIs for users" 

    end

    it "should return full URIs for users" 


    it "should return full URIs for groups" 

    context "from other shard" do
      specs_require_sharding
      it "should return full path across shards" 

    end
  end
end

