#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "communication channel selenium tests" do
  include_context "in-process server selenium tests"

  context "confirm" do
    it "should register the user" 


    it "should not show a mysterious error" 


    it "should require the terms if configured to do so" 


    it "should not require the terms if the user has already accepted them" 


    it "should allow the user to edit the pseudonym if its already taken" 


    it 'confirms the communication channels', priority: "2", test_id: 193786 do
      user_with_pseudonym({active_user: true})
      create_session(@pseudonym)

      get '/profile/settings'
      expect(f('.email_channels')).to contain_css('.unconfirmed')
      f('.email_channels .path').click
      Notification.create!(name: 'Confirm Email Communication Channel', category: 'Registration')
      f('#confirm_email_channel .re_send_confirmation_link').click
      expect(Message.last.subject).to eq('Confirm Email: Canvas')
      url = Message.last.url

      # get the registration id from the url
      get '/register/' + url.split('/')[4]
      expect(f('#flash_message_holder')).to include_text 'Registration confirmed!'
      get '/profile/settings'
      # the email id does not have a link anymore
      expect(f('.email_channels')).not_to contain_link('nobody@example.com')
    end

    it 'resends sms confirmations properly' 


    it 'should show the bounce count reset button when a siteadmin is masquerading' 


    it 'should not show the bounce count reset button when an account admin is masquerading' 


    it 'should not show the bounce count reset button when the channel is not bouncing' 

  end
end

