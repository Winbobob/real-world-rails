#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../../messages/messages_helper')
require_dependency "services/notification_service"

module Services
  describe NotificationService do
    context "message delivery" do
      before(:once) do
          user_model
          @au = tie_user_to_account(@user, account: account_model)
          @account.root_account.enable_feature!(:notification_service)
          @message = generate_message(:account_user_notification, :email, @au, user: @user)
          @message.user.account.root_account.enable_feature!(:notification_service)
          @message.save!
          @message.to = "testing123"
          @at = AccessToken.create!(:user => @user, :developer_key => DeveloperKey.default)
      end

      before(:each) do
        @queue = double('notification queue')
        allow(NotificationService).to receive(:notification_queue).and_return(@queue)
      end

      it "processes email message type" 


      it "processes twitter message type" 


      it "processes twilio message type" 


      it "processes sms message type" 


      it "expects email sms message type to go through mailer" 


      it "expects twilio to not call mailer create_message" 


      it "processes push notification message type" 


      it "throws error if cannot connect to queue" 


      it "throws error if queue does not exist" 


      context 'payload contents' do
        class SendMessageSpy
          attr_accessor :sent_hash
          def send_message(message_body: , queue_url: )
            @sent_hash = JSON.parse(message_body)
          end
        end

        it "sends all parameters (directly)" 

      end
    end
  end
end

