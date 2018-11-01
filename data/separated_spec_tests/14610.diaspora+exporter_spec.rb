# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Diaspora::Exporter do
  let(:user) { FactoryGirl.create(:user_with_aspect) }

  context "output json" do
    let(:json) { Diaspora::Exporter.new(user).execute }

    it "matches archive schema" 


    it "contains basic user data" 


    it "contains aspects" 


    it "contains contacts" 


    it "contains a public status message" 


    it "contains a status message with subscribers" 


    it "contains a status message with a poll" 


    it "contains a status message with a photo" 


    it "contains a status message with a location" 


    it "contains a reshare" 


    it "contains followed tags" 


    it "contains post subscriptions" 


    it "contains a comment" 


    it "contains a like" 


    it "contains a poll participation" 


    it "contains a comment for the user's post" 


    it "contains a like for the user's post" 


    it "contains a poll participation for the user's post" 


    def transform_value(value)
      return value.iso8601 if value.is_a? Date
      value
    end

    def build_property_hash(object, direct_properties, aliased_properties={})
      props = direct_properties.map {|key|
        [key, transform_value(object.send(key))]
      }.to_h

      aliased = aliased_properties.map {|key, key_alias|
        [key, object.send(key_alias)]
      }.to_h

      props.merge(aliased)
    end
  end
end

