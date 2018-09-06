require 'spec_helper'

describe CommentDecorator do
  let(:comment) { double(:comment) }
  let(:decorated_comment) { CommentDecorator.decorate comment }
  let(:user) { double(:user, gravatar: true) }

  describe '#user_gravatar' do
    it 'calls "gravatar" method on user' 

  end
end

