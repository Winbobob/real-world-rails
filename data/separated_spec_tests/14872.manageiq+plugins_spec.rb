describe Vmdb::Plugins do
  it ".all" 


  it ".ansible_content" 


  it ".automate_domains" 


  it ".system_automate_domains" 


  describe ".asset_paths" do
    it "with normal engines" 


    it "with engines with inflections" 

  end

  it ".provider_plugins" 


  it ".versions" 


  describe ".version (private)" do
    subject { described_class.send(:instance).send(:version, engine) }

    let(:engine) { Class.new(Rails::Engine) }

    def clear_versions_caches
      described_class.send(:instance).instance_variable_set(:@bundler_specs_by_path, nil)
    end

    before { clear_versions_caches }
    after  { clear_versions_caches }

    def with_temp_dir(_options)
      Dir.mktmpdir("plugins_spec") do |dir|
        allow(engine).to receive(:root).and_return(Pathname.new(dir))
        yield dir
      end
    end

    def with_temp_git_dir(options)
      with_temp_dir(options) do |dir|
        sha = nil

        Dir.chdir(dir) do
          `
          git init &&
          touch foo  && git add -A && git commit -m "Added foo" &&
          touch foo2 && git add -A && git commit -m "Added foo2"
          `

          if options[:branch] == "master"
            sha = `git rev-parse HEAD`.strip
          else
            sha = `git rev-parse HEAD~`.strip
            `git checkout #{"-b #{options[:branch]}" if options[:branch]} #{sha} 2>/dev/null`
            `git tag #{options[:tag]}` if options[:tag]
          end
        end

        yield dir, sha
      end
    end

    def with_spec(type, options = {})
      raise "Unexpected type '#{type}'" unless %i(git path_with_git path).include?(type)

      source =
        if type == :git
          instance_double(Bundler::Source::Git, :branch => options[:branch], :options => {"tag" => options[:tag]})
        else
          instance_double(Bundler::Source::Path)
        end

      allow(Bundler::Source::Git).to receive(:===).with(source).and_return(type == :git)
      allow(Bundler::Source::Path).to receive(:===).with(source).and_return(type != :git)

      method = (type == :path ? :with_temp_dir : :with_temp_git_dir)

      send(method, options) do |dir, sha|
        expect(source).to receive(:revision).and_return(sha) if type == :git

        spec = instance_double(Gem::Specification, :full_gem_path => dir, :source => source)
        expect(Bundler.environment).to receive(:specs).and_return([spec])

        yield(sha && sha[0, 8])
      end
    end

    it "git based, on master" 


    it "git based, on a branch" 


    it "git based, on a tag" 


    it "git based, on a sha" 


    it "path based, with git, on master" 


    it "path based, with git, on a branch" 


    it "path based, with git, on a tag" 


    it "path based, with git, on a sha" 


    it "path based, without git" 

  end
end

