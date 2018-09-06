# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require "integration/federation/federation_helper"

describe "attack vectors", type: :request do
  before do
    allow_callbacks(%i(queue_public_receive queue_private_receive receive_entity fetch_related_entity fetch_public_key))
  end

  let(:eves_aspect) { eve.aspects.find_by_name("generic") }
  let(:alices_aspect) { alice.aspects.find_by_name("generic") }

  it "other users can not grant visiblity to another users posts by sending their friends post to themselves" 


  context "author does not match xml author" do
    it "should not overwrite another persons profile" 


    it "public post should not be spoofed from another author" 


    it "should not receive retractions where the retractor and the salmon author do not match" 


    it "should not receive contact retractions from another person" 

  end

  it "does not save a message over an old message with a different author" 


  it "does not save a message over an old message with the same author" 


  it "ignores retractions on a post not owned by the retraction's sender" 


  it "does not let another user update other persons post" 

end

