require 'rails_helper'

RSpec.describe WebHookPostSerializer do
  let(:admin) { Fabricate(:admin) }
  let(:post) { Fabricate(:post) }

  def serialized_for_user(u)
    WebHookPostSerializer.new(post, scope: Guardian.new(u), root: false).as_json
  end

  it 'should only include the required keys' 


  it 'should only include deleted topic title for staffs' 

end

