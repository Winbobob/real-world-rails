require 'rails_helper'

describe CommentOnSkipping do
  let(:user) { User.new first_name: 'John'}
  let(:support_user) { User.new first_name: 'Martin' }
  let(:support)  { Support.new }
  subject { described_class.new(user, support, support_user) }

  describe "#new_comment" do
    it 'includes previous supporter name' 


    it 'includes current supporter name' 

  end
end

