require 'spec_helper'
require 'support/couchdb_client_helper'

describe Child, :type => :request do
  include CouchdbClientHelper
  it 'should save a child in the database' 


  it 'should load an existing child record from the database' 


  it 'should persist multiple photo attachments' 

end

private

def build_child(created_by, options = {})
  user = User.new(:user_name => created_by)
  Child.new_with_user_name user, options
end

def verify_attachment(attachment, uploadable_file)
  expect(attachment.content_type).to eq(uploadable_file.content_type)
  expect(attachment.data.size).to eq(uploadable_file.data.size)
end

def display_child_errors(errors)
  errors.values.each { |value| puts value }
end

