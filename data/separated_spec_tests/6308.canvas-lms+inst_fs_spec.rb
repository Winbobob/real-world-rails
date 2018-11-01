#
# Copyright (C) 2017 - present Instructure, Inc.
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

require 'spec_helper'

describe InstFS do
  context "settings are set" do
    before do
      @app_host = 'http://test.host'
      @secret = "supersecretyup"
      allow(InstFS).to receive(:enabled?).and_return(true)
      allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).
        with(service: "inst-fs", default_ttl: 5.minutes).
        and_return({
          'app-host' => @app_host,
          'secret' => Base64.encode64(@secret)
        })
    end

    it "returns decoded base 64 secret" 


    context "authenticated_url" do
      before :each do
        @attachment = attachment_with_context(user_model)
        @attachment.instfs_uuid = 1
        @attachment.filename = "test+with+spaces.txt"
        @attachment.display_name = "test with spaces.txt"
      end

      it "constructs url properly" 


      it "passes download param" 


      it "includes a properly signed token" 


      it "includes an expiration on the token" 


      describe "jwt claims" do
        def claims_for(options={})
          url = InstFS.authenticated_url(@attachment, options)
          token = url.split(/token=/).last
          Canvas::Security.decode_jwt(token, [ @secret ])
        end

        it "includes global user_id claim in the token if user provided" 


        it "sets file name to display_name" 


        it "includes distinct global acting_as_user_id claim in the token if acting_as provided" 


        it "omits user_id claim in the token if no user provided" 


        describe "legacy api claims" do
          let(:root_account) { Account.default }
          let(:access_token) { instance_double("AccessToken", global_developer_key_id: 106) }

          it "are not added without an access token" 


          describe "with an access token" do
            it "are added when all keys are whitelisted" 


            it "are added when its developer key is specifically whitelisted" 


            it "are not added when its developer key is not specifically whitelisted" 

          end
        end
      end
    end

    context "authenticated_thumbnail_url" do
      before :each do
        @attachment = attachment_with_context(user_model)
        @attachment.instfs_uuid = 1
        @attachment.filename = "test.txt"
      end

      it "constructs url properly" 


      it "passes geometry param" 


      it "includes a properly signed token" 


      it "includes an expiration on the token" 

    end

    context "upload_preflight_json" do
      let(:context) { instance_double("Course", id: 1, global_id: 101) }
      let(:root_account) { Account.default }
      let(:user) { instance_double("User", id: 2, global_id: 102) }
      let(:acting_as) { instance_double("User", id: 4, global_id: 104) }
      let(:folder) { instance_double("Folder", id: 3, global_id: 103) }
      let(:filename) { 'test.txt' }
      let(:content_type) { 'text/plain' }
      let(:quota_exempt) { true }
      let(:on_duplicate) { 'rename' }
      let(:include_param) { ['avatar'] }
      let(:capture_url) { 'http://canvas.host/api/v1/files/capture' }
      let(:additional_capture_params) do
        { additional_note: 'notefull' }
      end

      let(:default_args) do
        {
          context: context,
          user: user,
          acting_as: acting_as,
          access_token: nil,
          root_account: root_account,
          folder: folder,
          filename: filename,
          content_type: content_type,
          quota_exempt: quota_exempt,
          on_duplicate: on_duplicate,
          capture_url: capture_url,
          include_param: include_param,
          additional_capture_params: additional_capture_params,
        }
      end

      let(:preflight_json) do
        InstFS.upload_preflight_json(default_args)
      end

      it "includes a static 'file' file_param" 


      it "includes an upload_url pointing at the service" 


      it "include a JWT in the query param of the upload_url" 


      describe "the upload JWT" do
        let(:jwt) do
          token = preflight_json[:upload_url].split('token=').last
          Canvas::Security.decode_jwt(token, [ @secret ])
        end

        it "embeds the user_id and acting_as_user_id in the token" 


        it "embeds a capture_url in the token" 


        it "embeds a capture_params hash in the token" 


        describe "the capture_params" do
          let(:capture_params) { jwt['capture_params'] }

          it "include the context" 


          it "include the acting_as user" 


          it "include the folder" 


          it "include the root_account_id" 


          it "include the quota_exempt flag" 


          it "include the on_duplicate method" 


          it "include the include options" 


          it "include additional_capture_params" 

        end
      end

      it "includes an upload_params hash" 


      describe "the upload_params" do
        let(:upload_params) { preflight_json[:upload_params] }

        it "include the filename" 


        it "include the content_type" 

      end

      describe "legacy api jwt claims" do
        let(:access_token) { instance_double("AccessToken", global_developer_key_id: 106) }

        def claims_for(options)
          json = InstFS.upload_preflight_json(default_args.merge(options))
          token = json[:upload_url].split('token=').last
          Canvas::Security.decode_jwt(token, [ @secret ])
        end

        it "are not added without an access token" 


        describe "with an access token" do
          it "are added when all keys are whitelisted" 


          it "are added when its developer key is specifically whitelisted" 


          it "are not added when its developer key is not specifically whitelisted" 

        end
      end

      context "upload via url" do
        it "throw ArgumentError when appropriate" 


        it "responds properly when passed target_url and progress_json" 

      end
    end

    context "logout" do
      it "makes a DELETE request against the logout url" 


      it "includes jwt in DELETE request" 


      it "skips if user absent" 


      it "skips if not enabled" 


      it "logs then ignores error if DELETE request fails" 

    end

    context "direct upload" do
      it "makes a network request to the inst-fs endpoint" 


      it "requests a streaming upload to allow large files" 

    end
  end

  context "settings not set" do
    before do
      @app_host = 'http://test.host'
      @secret = "supersecretyup"
      allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).with(service: "inst-fs").
        and_return({
          'app-host' => nil,
          'secret' => nil
        })
    end

    it "instfs is not enabled" 

    it "doesn't error on jwt_secret" 

  end
end

