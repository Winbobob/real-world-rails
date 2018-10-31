describe GitWorktree do
  context "repository" do
    before do
      @git_db = "TestGit.git"
      @ae_db_dir = Dir.mktmpdir
      @default_hash = {:a => "one", :b => "two", :c => "three"}
      @dirnames = %w(A B c)
      @repo_path = File.join(@ae_db_dir, @git_db)
      @filenames = %w(A/File1.YamL B/File2.YamL c/File3.YAML)
      @deleted_names = %w(A A/File1.YamL)
      @conflict_file = 'A/File1.YamL'
      @master_url = "file://#{@repo_path}"
      @repo_options = {:path     => @repo_path,
                       :username => "user1",
                       :email    => "user1@example.com",
                       :bare     => true,
                       :new      => true}
      @ae_db = GitWorktree.new(@repo_options)
      @original_commit = add_files_to_bare_repo(@filenames)
    end

    after do
      FileUtils.rm_rf(@ae_db_dir) if Dir.exist?(@ae_db_dir)
    end

    def add_files_to_bare_repo(flist)
      flist.each { |f| @ae_db.add(f, YAML.dump(@default_hash.merge(:fname => f))) }
      @ae_db.save_changes("files added")
      @ae_db.instance_variable_get('@repo').head.target.oid
    end

    def clone(url)
      dir = Dir.mktmpdir
      options = {:path          => dir,
                 :url           => url,
                 :username      => "user1",
                 :email         => "user1@example.com",
                 :ssl_no_verify => true,
                 :bare          => true,
                 :clone         => true}
      return dir, GitWorktree.new(options)
    end

    def open_existing_repo
      options = {:path     => @repo_path,
                 :username => "user1",
                 :email    => "user1@example.com"}
      GitWorktree.new(options)
    end

    it "#delete_repo" 


    it "#remove of existing file" 


    it "#remove of non existing file" 


    it "#remove_dir existing directory" 


    it "#file_exists? missing" 


    it "#read_file that exists" 


    it "#file_attributes" 


    it "#read_file that doesn't exist" 


    it "#entries" 


    it "#entries in A" 


    it "get list of files" 


    it "#directory_exists?" 


    it "#nodes" 


    it "rename directory" 


    it "rename directory when target exists" 


    it "move directories with similar names" 


    it "move intermediate directories with similar names" 


    it "get list of files from a specific commit" 


    it "can delete directories" 


    it "rename file with new contents" 


    it "rename file" 


    it "manage conflicts" 


    it "clone repo" 


    it "push changes to master repo" 


    it "push changes to master with no conflicts" 


    it "push changes to master with conflicts" 


    it "pull updates in a cloned repo" 

  end

  describe "git branches" do
    let(:git_repo_path) { Rails.root.join("spec/fixtures/git_repos/branch_and_tag.git") }
    let(:test_repo) { GitWorktree.new(:path => git_repo_path.to_s) }

    describe "#branches" do
      it "all branches" 


      it "local branches only" 


      it "remote branches only" 

    end

    describe "#file_list" do
      it "get list of files in a branch" 

    end

    describe "#branch_info" do
      it "get branch info" 

    end

    describe "#branch" do
      it "non existent branch" 

    end
  end

  describe "git branches with no master" do
    let(:git_repo_path) { Rails.root.join("spec/fixtures/git_repos/no_master.git") }
    let(:test_repo) { GitWorktree.new(:path => git_repo_path.to_s) }

    describe "#branches" do
      it "all branches" 

    end

    describe "#file_list" do
      it "get list of files in a branch" 

    end
  end

  describe 'git tags' do
    let(:git_repo_path) { Rails.root.join("spec/fixtures/git_repos/branch_and_tag.git") }
    let(:test_repo) { GitWorktree.new(:path => git_repo_path.to_s) }

    describe "#tags" do
      it "get list of tags" 

    end

    describe "#file_list" do
      it "get list of files in a tag" 

    end

    describe "#tag_info" do
      it "get tag info" 

    end

    describe "#tag" do
      it "non existent tag" 

    end
  end

  describe 'credentials_cb' do
    let(:git_repo_path) { Rails.root.join("spec", "fixtures", "git_repos", "branch_and_tag.git") }
    let(:test_repo) { GitWorktree.new(:path => git_repo_path.to_s) }

    describe "#credentials_cb" do
      it "call the credentials callback" 

    end
  end
end

