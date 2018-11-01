require 'spec_helper'
require 'fileutils'

describe RepositoryCheck::SingleRepositoryWorker do
  subject(:worker) { described_class.new }

  it 'skips when the project has no push events' 


  it 'fails when the project has push events and a broken repository' 


  it 'succeeds when the project repo is valid' 


  it 'fails if the wiki repository is broken' 


  it 'skips wikis when disabled' 


  it 'creates missing wikis' 


  it 'does not create a wiki if the main repo does not exist at all' 


  def create_push_event(project)
    project.events.create(action: Event::PUSHED, author_id: create(:user).id)
  end

  def break_wiki(project)
    Gitlab::GitalyClient::StorageSettings.allow_disk_access do
      break_repo(wiki_path(project))
    end
  end

  def wiki_path(project)
    project.wiki.repository.path_to_repo
  end

  def break_project(project)
    Gitlab::GitalyClient::StorageSettings.allow_disk_access do
      break_repo(project.repository.path_to_repo)
    end
  end

  def break_repo(repo)
    # Create or replace blob ffffffffffffffffffffffffffffffffffffffff with an empty file
    # This will make the repo invalid, _and_ 'git init' cannot fix it.
    path = File.join(repo, 'objects', 'ff')
    file = File.join(path, 'ffffffffffffffffffffffffffffffffffffff')

    FileUtils.mkdir_p(path)
    FileUtils.rm_f(file)
    FileUtils.touch(file)
  end
end

