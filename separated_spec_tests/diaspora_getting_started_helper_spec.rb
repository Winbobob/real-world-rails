# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe GettingStartedHelper, :type => :helper do
  before do
    @current_user = alice
  end

  def current_user
    @current_user
  end

  describe "#has_completed_getting_started?" do
    it 'returns true if the current user has completed getting started' 


    it 'returns false if the current user has not completed getting started' 

  end
end

