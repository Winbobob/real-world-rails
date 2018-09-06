require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20171103140253_track_untracked_uploads')

describe TrackUntrackedUploads, :migration, :sidekiq do
  include MigrationsHelpers::TrackUntrackedUploadsHelpers

  it 'correctly schedules the follow-up background migration' 

end

