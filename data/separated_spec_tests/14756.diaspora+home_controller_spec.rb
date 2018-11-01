# frozen_string_literal: true

#   Copyright (c) 2010-2012, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe HomeController, type: :controller do
  describe "#show" do
    it "does not redirect for :html if there is at least one admin" 


    it "redirects to the podmin page for :html if there is no admin" 


    it "redirects to the sign in page for :mobile" 


    it "redirects to the stream if the user is signed in" 

  end

  describe "#podmin" do
    it "succeeds" 


    it "succeeds on mobile" 

  end

  describe "#toggle_mobile" do
    it "changes :mobile to :html" 


    it "changes :html to :mobile" 

  end

  describe "#force_mobile" do
    it "changes :html to :mobile" 


    it "keeps :mobile" 

  end
end

