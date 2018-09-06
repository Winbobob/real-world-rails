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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../cassandra_spec_helper')

require 'csv'

describe PageViewsController do

  # Factory-like thing for page views.
  def page_view(user, url, options={})
    options.reverse_merge!(:request_id => 'req' + rand(100000000).to_s,
                           :user_agent => 'Firefox/12.0')
    options.merge!(:url => url)

    user_req = options.delete(:user_request)
    req_id = options.delete(:request_id)
    created_opt = options.delete(:created_at)
    pg = PageView.new(options)
    pg.user = user
    pg.user_request = user_req
    pg.request_id = req_id
    pg.created_at = created_opt
    pg.updated_at = created_opt
    pg.save!
    pg
  end

  shared_examples_for "GET 'index' as csv" do
    before :once do
      account_admin_user
    end

    before :each do
      student_in_course
      user_session(@admin)
    end

    it "should succeed" 


    it "should order rows by created_at in DESC order" 

  end

  context "with db page views" do
    before :once do
      Setting.set('enable_page_views', true)
    end
    include_examples "GET 'index' as csv"
  end

  context "with cassandra page views" do
    include_examples 'cassandra page views'
    include_examples "GET 'index' as csv"

    context "POST 'update'" do
      it "catches a cassandra error" 

    end
  end

  context "pv4" do
    before do
      allow(PageView).to receive(:pv4?).and_return(true)
      ConfigFile.stub('pv4', {})
    end

    describe "GET 'index'" do
      it "properly plumbs through time restrictions" 

    end
  end
end

