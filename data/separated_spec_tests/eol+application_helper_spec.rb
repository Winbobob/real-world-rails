require "spec_helper"

describe ApplicationHelper do

  before(:all) do
    load_foundation_cache
  end

  describe ApplicationHelper::EolFormBuilder do
    let(:helper) { ActionView::Base.new }
    let(:user)  { User.create(password: '') }
    let(:builder) { ApplicationHelper::EolFormBuilder.new :user, user, helper, {}, nil }
    it 'show have no allowed html help tips' 

    it 'includes errors in field HTML' 

    it 'includes errors in field HTML when a block is given' 

  end
end

