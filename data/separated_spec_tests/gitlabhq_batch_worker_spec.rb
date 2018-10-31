require 'spec_helper'

describe RepositoryCheck::BatchWorker do
  subject { described_class.new }

  it 'prefers projects that have never been checked' 


  it 'sorts projects by last_repository_check_at' 


  it 'excludes projects that were checked recently' 


  it 'does nothing when repository checks are disabled' 


  it 'skips projects created less than 24 hours ago' 

end

