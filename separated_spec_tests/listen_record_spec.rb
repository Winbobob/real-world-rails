RSpec.describe Listen::Record do
  let(:dir) { instance_double(Pathname, to_s: '/dir') }
  let(:record) { Listen::Record.new(dir) }

  def dir_entries_for(hash)
    hash.each do |dir, entries|
      allow(::Dir).to receive(:entries).with(dir) { entries }
    end
  end

  def real_directory(hash)
    dir_entries_for(hash)
    hash.each do |dir, _|
      realpath(dir)
    end
  end

  def file(path)
    allow(::Dir).to receive(:entries).with(path).and_raise(Errno::ENOTDIR)
    path
  end

  def lstat(path, stat = nil)
    stat ||= instance_double(::File::Stat, mtime: 2.3, mode: 0755)
    allow(::File).to receive(:lstat).with(path).and_return(stat)
    stat
  end

  def realpath(path)
    allow(::File).to receive(:realpath).with(path).and_return(path)
    path
  end

  def symlink(hash_or_dir)
    if hash_or_dir.is_a?(String)
      allow(::File).to receive(:realpath).with(hash_or_dir).
        and_return(hash_or_dir)
    else
      hash_or_dir.each do |dir, real_path|
        allow(::File).to receive(:realpath).with(dir).and_return(real_path)
      end
    end
  end

  def record_tree(record)
    record.instance_variable_get(:@tree)
  end

  describe '#update_file' do
    context 'with path in watched dir' do
      it 'sets path by spliting dirname and basename' 


      it 'sets path and keeps old data not overwritten' 

    end

    context 'with subdir path' do
      it 'sets path by spliting dirname and basename' 


      it 'sets path and keeps old data not overwritten' 

    end
  end

  describe '#add_dir' do
    it 'sets itself when .' 


    it 'sets itself when nil' 


    it 'sets itself when empty' 


    it 'correctly sets new directory data' 


    it 'sets path and keeps old data not overwritten' 

  end

  describe '#unset_path' do
    context 'within watched dir' do
      context 'when path is present' do
        before { record.update_file('file.rb', mtime: 1.1) }

        it 'unsets path' 

      end

      context 'when path not present' do
        it 'unsets path' 

      end
    end

    context 'within subdir' do
      context 'when path is present' do
        before { record.update_file('path/file.rb', mtime: 1.1) }

        it 'unsets path' 

      end

      context 'when path not present' do
        it 'unsets path' 

      end
    end
  end

  describe '#file_data' do
    context 'with path in watched dir' do
      context 'when path is present' do
        before { record.update_file('file.rb', mtime: 1.1) }

        it 'returns file data' 

      end

      context 'path not present' do
        it 'return empty hash' 

      end
    end

    context 'with path in subdir' do
      context 'when path is present' do
        before { record.update_file('path/file.rb', mtime: 1.1) }

        it 'returns file data' 

      end

      context 'path not present' do
        it 'return empty hash' 

      end
    end
  end

  describe '#dir_entries' do
    context 'in watched dir' do
      subject { record.dir_entries('.') }

      context 'with no entries' do
        it { should be_empty }
      end

      context 'with file.rb in record' do
        before { record.update_file('file.rb', mtime: 1.1) }
        it { should eq('file.rb' => { mtime: 1.1 }) }
      end

      context 'with subdir/file.rb in record' do
        before { record.update_file('subdir/file.rb', mtime: 1.1) }
        it { should eq('subdir' => {}) }
      end
    end

    context 'in subdir /path' do
      subject { record.dir_entries('path') }

      context 'with no entries' do
        it { should be_empty }
      end

      context 'with path/file.rb already in record' do
        before { record.update_file('path/file.rb', mtime: 1.1) }
        it { should eq('file.rb' => { mtime: 1.1 }) }
      end
    end
  end

  describe '#build' do
    let(:dir1) { Pathname('/dir1') }

    before do
      stubs = {
        ::File => %w(lstat realpath),
        ::Dir => %w(entries exist?)
      }

      stubs.each do |klass, meths|
        meths.each do |meth|
          allow(klass).to receive(meth.to_sym) do |*args|
            fail "stub called: #{klass}.#{meth}(#{args.map(&:inspect) * ', '})"
          end
        end
      end
    end

    it 're-inits paths' 


    let(:foo_stat) { instance_double(::File::Stat, mtime: 1.0, mode: 0644) }
    let(:bar_stat) { instance_double(::File::Stat, mtime: 2.3, mode: 0755) }

    context 'with no subdirs' do
      before do
        real_directory('/dir' => %w(foo bar))
        lstat(file('/dir/foo'), foo_stat)
        lstat(file('/dir/bar'), bar_stat)
        real_directory('/dir2' => [])
      end

      it 'builds record' 

    end

    context 'with subdir containing files' do
      before do
        real_directory('/dir' => %w(dir1 dir2))
        real_directory('/dir/dir1' => %w(foo))
        real_directory('/dir/dir1/foo' => %w(bar))
        lstat(file('/dir/dir1/foo/bar'))
        real_directory('/dir/dir2' => [])
      end

      it 'builds record' 

    end

    context 'with subdir containing dirs' do
      before do
        real_directory('/dir' => %w(dir1 dir2))
        real_directory('/dir/dir1' => %w(foo))
        real_directory('/dir/dir1/foo' => %w(bar baz))
        real_directory('/dir/dir1/foo/bar' => [])
        real_directory('/dir/dir1/foo/baz' => [])
        real_directory('/dir/dir2' => [])

        allow(::File).to receive(:realpath) { |path| path }
      end

      it 'builds record' 

    end

    context 'with subdir containing symlink to parent' do
      subject { record.paths }
      before do
        real_directory('/dir' => %w(dir1 dir2))
        real_directory('/dir/dir1' => %w(foo))
        dir_entries_for('/dir/dir1/foo' => %w(dir1))
        symlink('/dir/dir1/foo' => '/dir/dir1')

        real_directory('/dir/dir2' => [])
      end

      it 'shows a warning' 

    end

    context 'with a normal symlinked directory to another' do
      subject { record.paths }

      before do
        real_directory('/dir' => %w(dir1))
        real_directory('/dir/dir1' => %w(foo))

        symlink('/dir/dir1/foo' => '/dir/dir2')
        dir_entries_for('/dir/dir1/foo' => %w(bar))
        lstat(realpath(file('/dir/dir1/foo/bar')))

        real_directory('/dir/dir2' => %w(bar))
        lstat(file('/dir/dir2/bar'))
      end

      it 'shows message' 

    end

    context 'with subdir containing symlinked file' do
      subject { record.paths }
      before do
        real_directory('/dir' => %w(dir1 dir2))
        real_directory('/dir/dir1' => %w(foo))
        lstat(file('/dir/dir1/foo'))
        real_directory('/dir/dir2' => [])
      end

      it 'shows a warning' 

    end
  end
end

