# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ShareVisibilitiesController, :type => :controller do
  before do
    @status = alice.post(:status_message, :text => "hello", :to => alice.aspects.first)
  end

  describe '#update' do
    context "on a post you can see" do
      before do
        sign_in(bob, scope: :user)
      end

      it 'succeeds' 


      it 'it calls toggle_hidden_shareable' 

    end

    context "on a post you can't see" do
      before do
        sign_in(eve, scope: :user)
      end

      it "raises an error" 


      it "it doesn't call toggle_hidden_shareable" 

    end
  end
end

