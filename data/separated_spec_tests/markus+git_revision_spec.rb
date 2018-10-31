describe GitRevision do
  context 'with a git repo' do
    before(:context) do
      repo_path = "#{::Rails.root}/data/test/repos/test_repo_workdir"
      unless GitRepository.repository_exists?(repo_path)
        GitRepository.create(repo_path)
      end
    end
    let!(:repo) { build(:git_repository) }
    describe '#files_at_path' do
      # Commit a file named test in the workdir
      before(:each) do
        transaction = repo.get_transaction('dummy') # dummy user_id

        transaction.add('test', 'testdata')
        repo.commit(transaction)
      end
      it 'retrieves an object with the same name from the repo' 

      it 'retrieves an object of type Repository::RevisionFile' 

      # retrieves objects not in the workdir
    end
    describe '#directories_at_path' do
      before(:each) do
        # Commit a file named test2 in a folder called testdir
        transaction = repo.get_transaction('dummy') # dummy user_id

        transaction.add('testdir/test', 'testdata')
        repo.commit(transaction)
      end
      it 'retrieves an object with the same name from the repo' 

      it 'retrieves an object of type Repository::RevisionDirectory' 

    end

    describe '#stringify' do
      before(:each) do
        transaction = repo.get_transaction('dummy') # dummy user_id

        transaction.add('test', 'testdata')
        repo.commit(transaction)
      end
      it 'gets the correct file data' 

    end
  end
end

