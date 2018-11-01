require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180619121030_enqueue_delete_diff_files_workers.rb')

describe EnqueueDeleteDiffFilesWorkers, :migration, :sidekiq do
  it 'correctly schedules diff files deletion schedulers' 

end

