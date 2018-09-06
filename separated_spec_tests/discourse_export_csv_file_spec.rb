require 'rails_helper'

describe Jobs::ExportCsvFile do

  context '.execute' do
    let(:user) { Fabricate(:user, username: "john_doe") }

    it 'raises an error when the entity is missing' 


    it 'works' 

  end

  let(:user_list_header) {
    %w{
      id name username email title created_at last_seen_at last_posted_at
      last_emailed_at trust_level approved suspended_at suspended_till blocked
      active admin moderator ip_address staged topics_entered posts_read_count
      time_read topic_count post_count likes_given likes_received location
      website views external_id external_email external_username external_name
      external_avatar_url
    }
  }

  let(:user_list_export) { Jobs::ExportCsvFile.new.user_list_export }

  def to_hash(row)
    Hash[*user_list_header.zip(row).flatten]
  end

  it 'exports sso data' 

end

