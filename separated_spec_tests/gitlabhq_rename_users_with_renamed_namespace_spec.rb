require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170518200835_rename_users_with_renamed_namespace.rb')

describe RenameUsersWithRenamedNamespace, :delete do
  it 'renames a user that had their namespace renamed to the namespace path' 

end

