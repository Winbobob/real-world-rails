require 'spec_helper'
# To define Sidekiq::Shutdown
require 'sidekiq/cli'

describe Morph::Runner do
  describe ".log" do
    # TODO Hmmm.. When do the callbacks get reenabled?
    before(:each) { Searchkick.disable_callbacks }
    let(:owner) { User.create(nickname: 'mlandauer') }
    let(:run) { Run.create(owner: owner) }
    let(:runner) { Morph::Runner.new(run) }

    it "should log console output to the run" 


    it "should truncate a very long entry" 

  end

  describe '.go', docker: true do
    it 'should run without an associated scraper' 


    it 'should magically handle a sidekiq queue restart' 


    it 'should handle restarting from a stopped container' 


    it 'should be able to limit the number of lines of output' 


    # Have to disable the test below for the time being because we can't
    # hardcode the morph subnet anymore after the update of the morph server
    # to Xenial
    # it 'should record the container ip address in the run' do
    #   owner = User.create(nickname: 'mlandauer')
    #   run = Run.create(owner: owner)
    #   FileUtils.rm_rf(run.data_path)
    #   FileUtils.rm_rf(run.repo_path)
    #   fill_scraper_for_run('save_to_database', run)
    #   runner = Morph::Runner.new(run)
    #   runner.go_with_logging {}
    #   run.reload
    #   subnet = run.ip_address.split('.')[0..1].join('.')
    #   expect(subnet).to eq "192.168"
    # end

    it 'should be able to correctly limit the number of lines even after a restart' 

  end

  # TODO: Test that we can stop the compile stage
  describe ".stop!", docker: true do
    it 'should be able to stop a scraper running in a continuous loop' 

  end

  describe '.add_config_defaults_to_directory' do
    before(:each) { FileUtils.mkdir('test') }
    after(:each) { FileUtils.rm_rf('test') }

    context 'a perl scraper' do
      before(:each) { FileUtils.touch('test/scraper.pl') }

      it do
        Dir.mktmpdir do |dir|
          Morph::Runner.add_config_defaults_to_directory('test', dir)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'Procfile', 'app.psgi', 'cpanfile', 'scraper.pl']
          perl = Morph::Language.new(:perl)
          expect(File.read(File.join(dir, 'Procfile'))).to eq perl.procfile
          expect(File.read(File.join(dir, 'app.psgi')))
            .to eq File.read(perl.default_config_file_path('app.psgi'))
          expect(File.read(File.join(dir, 'cpanfile')))
            .to eq File.read(perl.default_config_file_path('cpanfile'))
        end
      end
    end

    context 'a ruby scraper' do
      before(:each) { FileUtils.touch('test/scraper.rb') }

      context 'user tries to override Procfile' do
        before :each do
          File.open('test/Procfile', 'w') { |f| f << 'scraper: some override' }
          FileUtils.touch('test/Gemfile')
          FileUtils.touch('test/Gemfile.lock')
        end

        it 'should always use the template Procfile' 

      end

      context 'user supplies Gemfile and Gemfile.lock' do
        before :each do
          FileUtils.touch('test/Gemfile')
          FileUtils.touch('test/Gemfile.lock')
        end

        it 'should only provide a template Procfile' 

      end

      context 'user does not supply Gemfile or Gemfile.lock' do
        it 'should provide a template Gemfile, Gemfile.lock and Procfile' 

      end

      context 'user supplies Gemfile but no Gemfile.lock' do
        before :each do
          FileUtils.touch('test/Gemfile')
        end

        it 'should not try to use the template Gemfile.lock' 

      end
    end
  end

  describe '.remove_hidden_directories' do
    context 'a set of files' do
      before :each do
        FileUtils.mkdir_p('test/foo')
        FileUtils.mkdir_p('test/.bar')
        FileUtils.touch('test/.a_dot_file.cfg')
        FileUtils.touch('test/.bar/wibble.txt')
        FileUtils.touch('test/one.txt')
        FileUtils.touch('test/Procfile')
        FileUtils.touch('test/two.txt')
        FileUtils.touch('test/foo/three.txt')
        FileUtils.touch('test/Gemfile')
        FileUtils.touch('test/Gemfile.lock')
        FileUtils.touch('test/scraper.rb')
        FileUtils.ln_s('scraper.rb', 'test/link.rb')
      end

      after :each do
        FileUtils.rm_rf('test')
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerUtils.copy_directory_contents('test', dir)
          Morph::Runner.remove_hidden_directories(dir)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', '.a_dot_file.cfg', 'Gemfile', 'Gemfile.lock',
            'Procfile', 'foo', 'link.rb', 'one.txt', 'scraper.rb', 'two.txt']
        end
      end
    end

    context 'another set of files' do
      before :each do
        FileUtils.mkdir_p('test/foo')
        FileUtils.touch('test/one.txt')
        FileUtils.touch('test/foo/three.txt')
        FileUtils.touch('test/Gemfile')
        FileUtils.touch('test/Gemfile.lock')
        FileUtils.touch('test/scraper.rb')
      end

      after :each do
        FileUtils.rm_rf('test')
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerUtils.copy_directory_contents('test', dir)
          Morph::Runner.remove_hidden_directories(dir)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'Gemfile', 'Gemfile.lock', 'foo', 'one.txt',
            'scraper.rb']
        end
      end
    end

    context 'user tries to override Procfile' do
      before :each do
        FileUtils.mkdir_p('test')
        File.open('test/Procfile', 'w') { |f| f << 'scraper: some override' }
        FileUtils.touch('test/scraper.rb')
      end

      after :each do
        FileUtils.rm_rf('test')
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerUtils.copy_directory_contents('test', dir)
          Morph::Runner.remove_hidden_directories(dir)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'Procfile', 'scraper.rb']
        end
      end
    end
  end
end

def fill_scraper_for_run(scraper_name, run)
  FileUtils.mkdir_p(run.repo_path)
  FileUtils::cp_r(
    File.join(File.dirname(__FILE__), 'test_scrapers', 'runner_spec', scraper_name, '.'),
    run.repo_path
  )
end

