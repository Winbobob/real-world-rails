# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Diaspora::Federated::Base do
  class Foo
    include Diaspora::Federated::Base
  end

  let(:foo) { Foo.new }

  describe "#object_to_receive" do
    it "returns self" 

  end

  describe "#subscribers" do
    it "throws an error if the including module does not redefine it" 

  end
end

