require 'spec_helper'
require 'memory_profiler'

describe Morph::DockerRunner do
  # Tests that involve docker are marked as 'docker: true'.

  # These are integration tests with the whole docker server and the
  # docker images that are used. Also, the tests are very slow!
  describe '.compile_and_run', docker: true do
    before(:each) do
      @dir = Dir.mktmpdir
      @container_count = Morph::DockerUtils.stopped_containers.count
    end

    after(:each) { FileUtils.remove_entry @dir }

    it "should let me know that it can't select a buildpack" 


    it "should stop if a python compile fails" 


    it 'should be able to run hello world' 


    def with_smaller_chunk_size(&block)
      chunk_size = Excon.defaults[:chunk_size]
      Excon.defaults[:chunk_size] = 1024
      result = yield
      Excon.defaults[:chunk_size] = chunk_size
      result
    end

    it 'should not allocate and retain too much memory when running scraper' 


    it "should attach the container to a special morph-only docker network" 


    it 'should be able to run hello world from a sub-directory' 


    it 'should cache the compile stage' 


    it 'should be able to run hello world of course' 


    it 'should be able to grab a file resulting from running the scraper' 


    it 'should be able to pass environment variables' 


    it 'should have an env variable set for python requests library' 


    it 'should return the ip address of the container' 


    it 'should return a non-zero error code if the scraper fails' 


    it 'should stream output if the right things are set for the language' 


    it 'should be able to reconnect to a running container' 


    it 'should be able to limit the amount of log output' 

  end

  skip 'should cache the compile' do
  end

  context 'a set of files' do
    before :each do
      FileUtils.mkdir_p 'test/foo'
      FileUtils.mkdir_p 'test/.bar'
      FileUtils.touch 'test/.a_dot_file.cfg'
      FileUtils.touch 'test/.bar/wibble.txt'
      FileUtils.touch 'test/one.txt'
      FileUtils.touch 'test/Procfile'
      FileUtils.touch 'test/two.txt'
      FileUtils.touch 'test/foo/three.txt'
      FileUtils.touch 'test/Gemfile'
      FileUtils.touch 'test/Gemfile.lock'
      FileUtils.touch 'test/scraper.rb'
      FileUtils.ln_s 'scraper.rb', 'test/link.rb'
    end

    after :each do
      FileUtils.rm_rf 'test'
    end

    describe '.copy_config_to_directory' do
      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, true)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'Gemfile', 'Gemfile.lock', 'Procfile']
          expect(File.read(File.join(dir, 'Gemfile'))).to eq ''
          expect(File.read(File.join(dir, 'Gemfile.lock'))).to eq ''
          expect(File.read(File.join(dir, 'Procfile'))).to eq ''
        end
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, false)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', '.a_dot_file.cfg', '.bar', 'foo', 'link.rb', 'one.txt',
            'scraper.rb', 'two.txt']
          expect(Dir.entries(File.join(dir, '.bar')).sort).to eq [
            '.', '..', 'wibble.txt']
          expect(Dir.entries(File.join(dir, 'foo')).sort).to eq [
            '.', '..', 'three.txt']
          expect(File.read(File.join(dir, '.a_dot_file.cfg'))).to eq ''
          expect(File.read(File.join(dir, '.bar', 'wibble.txt'))).to eq ''
          expect(File.read(File.join(dir, 'foo/three.txt'))).to eq ''
          expect(File.read(File.join(dir, 'one.txt'))).to eq ''
          expect(File.read(File.join(dir, 'scraper.rb'))).to eq ''
          expect(File.read(File.join(dir, 'two.txt'))).to eq ''
          expect(File.readlink(File.join(dir, 'link.rb'))).to eq 'scraper.rb'
        end
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

    describe '.copy_config_to_directory' do
      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, true)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'Gemfile', 'Gemfile.lock']
          expect(File.read(File.join(dir, 'Gemfile'))).to eq ''
          expect(File.read(File.join(dir, 'Gemfile.lock'))).to eq ''
        end
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, false)
          expect(Dir.entries(dir).sort).to eq [
            '.', '..', 'foo', 'one.txt', 'scraper.rb']
          expect(Dir.entries(File.join(dir, 'foo')).sort).to eq [
            '.', '..', 'three.txt']
          expect(File.read(File.join(dir, 'foo/three.txt'))).to eq ''
          expect(File.read(File.join(dir, 'one.txt'))).to eq ''
          expect(File.read(File.join(dir, 'scraper.rb'))).to eq ''
        end
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

    describe '.copy_config_to_directory' do
      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, true)
          expect(Dir.entries(dir).sort).to eq ['.', '..', 'Procfile']
          expect(File.read(File.join(dir, 'Procfile')))
            .to eq 'scraper: some override'
        end
      end

      it do
        Dir.mktmpdir do |dir|
          Morph::DockerRunner.copy_config_to_directory('test', dir, false)
          expect(Dir.entries(dir).sort).to eq ['.', '..', 'scraper.rb']
          expect(File.read(File.join(dir, 'scraper.rb'))).to eq ''
        end
      end
    end
  end
end

def copy_test_scraper(name)
  FileUtils::cp_r(
    File.join(File.dirname(__FILE__), 'test_scrapers', 'docker_runner_spec', name, '.'),
    @dir)
end

