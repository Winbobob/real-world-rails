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

describe EportfoliosController do
  def eportfolio_category
    @category = @portfolio.eportfolio_categories.create!(:name => "some category")
  end

  def category_entry
    @entry = @category.eportfolio_entries.create!(:name => "some entry", :eportfolio => @portfolio)
  end


  before :once do
    user_factory(active_all: true)
  end

  describe "GET 'user_index'" do
    before(:once){ eportfolio }

    it "should require authorization" 


    it "should redirect if eportfolios are disabled" 


    describe "with logged in user" do
      before{ user_session(@user) }

      let(:fake_signing_secret){ "asdfasdfasdfasdfasdfasdfasdfasdf" }
      let(:fake_encryption_secret){ "jkl;jkl;jkl;jkl;jkl;jkl;jkl;jkl;" }
      let(:fake_secrets){
        {
          "signing-secret" => fake_signing_secret,
          "encryption-secret" => fake_encryption_secret
        }
      }

      before do
        allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
        allow(Canvas::DynamicSettings).to receive(:find).with("canvas").and_return(fake_secrets)
      end

      it "assigns variables" 


      it "exposes the feature state for rich content service to js_env" 

    end
  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create portfolio" 

  end

  describe "GET 'show'" do
    before(:once){ eportfolio }
    it "should require authorization if the eportfolio is not public" 


    it "should complain if eportfolios are disabled" 


    describe "with authorized user" do
      before{ user_session(@user) }

      it "should show portfolio" 


      it "should create a category if one doesn't exist" 


      it "should create an entry in the first category if one doesn't exist" 


      it "exposes the feature state for rich content service to js_env" 

    end

    describe "assigns[:owner_url]" do
      before do
        @portfolio.public = true
        @portfolio.save!
      end

      it "should not get set when not logged in" 


      context "with profiles enabled" do
        before do
          Account.default.update_attribute :settings, enable_profiles: true
        end

        it "should be the profile url" 


        it "should not get set when portfolio owner is not visible to user" 

      end

      context "with profiles disabled" do
        before do
          Account.default.update_attribute :settings, enable_profiles: false
        end

        it "should be the settings url for the owner" 


        it "should be the user url for an admin" 


        it "should not get set otherwise" 

      end
    end
  end

  describe "PUT 'update'" do
    before(:once){ eportfolio }
    it "should require authorization" 


    it "should update portfolio" 

  end

  describe "DELETE 'destroy'" do
    before(:once){ eportfolio }
    it "should require authorization" 


    it "should delete portfolio" 

  end

  describe "POST 'reorder_categories'" do
    before(:once){ eportfolio }
    it "should require authorization" 


    it "should reorder categories" 

  end

  describe "POST 'reorder_entries'" do
    before(:once){ eportfolio }
    it "should require authorization" 


    it "should reorder entries" 

  end

  describe "GET 'public_feed.atom'" do
    before(:once) do
      eportfolio
      @portfolio.public = true
      @portfolio.save!
      eportfolio_category
      category_entry
    end

    it "should include absolute path for rel='self' link" 


    it "should include an author for each entry" 

  end

  describe "GET 'export'" do
    before(:once) do
      eportfolio
      @old_zipfile = @portfolio.attachments.build(:display_name => "eportfolio.zip")
      @old_zipfile.workflow_state = 'to_be_zipped'
      @old_zipfile.file_state = '0'
      @old_zipfile.save!
      Attachment.where(id: @old_zipfile).update_all(created_at: 1.day.ago)
    end

    it "should hard delete old zips if there are no associated attachments" 


    it "should hard delete old zips even if there are associated attachments" 


    it "should not fail on export if there is an empty entry" 

  end
end

