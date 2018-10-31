# encoding: UTF-8
require 'spec_helper'

describe Listen::DirectoryRecord do
  let(:base_directory) { File.dirname(__FILE__) }

  subject { described_class.new(base_directory) }

  describe '.generate_default_ignoring_patterns' do
    it 'creates regexp patterns from the default ignored directories and extensions' 


    it 'memoizes the generated results' 

  end

  describe '#initialize' do
    it 'sets the base directory' 


    it 'sets the base directory expanded' 


    it 'sets the default ignoring patterns' 


    it 'sets the default filtering patterns' 


    it 'raises an error when the passed path does not exist' 


    it 'raises an error when the passed path is not a directory' 

  end

  describe '#ignore' do
    it 'adds the passed paths to the list of ignored paths in the record' 

  end

  describe '#ignore!' do
    it 'replace the ignored paths in the record' 

  end

  describe '#filter' do
    it 'adds the passed regexps to the list of filters that determine the stored paths' 

  end

  describe '#filter!' do
    it 'replaces the passed regexps in the list of filters that determine the stored paths' 

  end

  describe '#ignored?' do
    before { subject.stub(:relative_to_base) { |path| path } }

    it 'tests paths relative to the base directory' 


    it 'returns true when the passed path is a default ignored path' 


    it 'returns false when the passed path is not a default ignored path' 


    it 'returns true when the passed path is ignored' 


    it 'returns false when the passed path is not ignored' 

  end

  describe '#filtered?' do
    before { subject.stub(:relative_to_base) { |path| path } }

    context 'when no filtering patterns are set' do
      it 'returns true for any path' 

    end

    context 'when filtering patterns are set' do
      before { subject.filter(%r{\.(?:jpe?g|gif|png)}) }

      it 'tests paths relative to the base directory' 


      it 'returns true when the passed path is filtered' 


      it 'returns false when the passed path is not filtered' 

    end
  end

  describe '#build' do
    it 'stores all files' 


    context 'with ignored path set' do
      it 'does not store ignored directory or its childs' 


      it 'does not store ignored files' 

    end

    context 'with filters set' do
      it 'only stores filterd files' 

    end
  end

  describe '#relative_to_base' do
    it 'removes the path of the base-directory from the passed path' 


    it 'returns nil when the passed path is not inside the base-directory' 


    it 'works with non UTF-8 paths' 


    context 'when there are utf-8 chars in base directory' do
      before do
        fixtures do |path|
          mkdir '目录'
          @dir = described_class.new(path + '/目录')
          @dir.build
        end
      end

      it 'works' 

    end

    context 'when containing regexp characters in the base directory' do
      before do
        fixtures do |path|
          mkdir 'a_directory$'
          @dir = described_class.new(path + '/a_directory$')
          @dir.build
        end
      end

      it 'removes the path of the base-directory from the passed path' 


      it 'returns nil when the passed path is not inside the base-directory' 

    end
  end

  describe '#fetch_changes' do
    context 'with single file changes' do
      context 'when a file is created' do
        it 'detects the added file' 


        it 'stores the added file in the record' 


        context 'given a new created directory' do
          it 'detects the added file' 


          it 'stores the added directory and file in the record' 

        end

        context 'given an existing directory' do
          context 'with recursive option set to true' do
            it 'detects the added file' 


            context 'with an ignored directory' do
              it "doesn't detect the added file" 


              it "doesn't detect the added file when it's asked to fetch the changes of the ignored directory"do
                fixtures do |path|
                  mkdir 'ignored_directory'

                  modified, added, removed = changes(path, :paths => ["#{path}/ignored_directory"], :ignore => %r{^ignored_directory/}, :recursive => true) do
                    touch 'ignored_directory/new_file.rb'
                  end

                  added.should be_empty
                  modified.should be_empty
                  removed.should be_empty
                end
              end
            end
          end

          context 'with recursive option set to false' do
            it "doesn't detect deeply-nested added files" 

          end
        end

        context 'given a directory with subdirectories' do
          it 'detects the added file' 


          context 'with an ignored directory' do
            it "doesn't detect added files in neither the directory nor the subdirectory" 

          end
        end
      end

      context 'when a file is modified' do
        it 'detects the modified file' 


        context 'during the same second at which we are checking for changes' do
          before { ensure_same_second }

          # The following test can only be run on systems that report
          # modification times in milliseconds.
          it 'always detects the modified file the first time', :if => described_class::HIGH_PRECISION_SUPPORTED do
            fixtures do |path|
              touch 'existing_file.txt'

              modified, added, removed = changes(path) do
                small_time_difference
                touch 'existing_file.txt'
              end

              added.should be_empty
              modified.should =~ %w(existing_file.txt)
              removed.should be_empty
            end
          end

          context 'when a file is created and then checked for modifications at the same second - #27' do
            # This issue was the result of checking a file for content changes when
            # the mtime and the checking time are the same. In this case there
            # is no checksum saved, so the file was reported as being changed.
            it 'does not report any changes' 

          end

          it 'detects the modified file the second time if the content have changed' 


          it "doesn't checksum the contents of local sockets (#85)", :unless => windows? do
            require 'socket'
            fixtures do |path|
              Digest::SHA1.should_not_receive(:file)
              socket_path = File.join(path, "unix_domain_socket")
              server = UNIXServer.new(socket_path)
              modified, added, removed = changes(path) do
                t = Thread.new do
                  client = UNIXSocket.new(socket_path)
                  client.write("foo")
                end
                t.join
              end
              added.should be_empty
              modified.should be_empty
              removed.should be_empty
            end
          end

          it "doesn't detects the modified file the second time if just touched - #62", :unless => described_class::HIGH_PRECISION_SUPPORTED do
            fixtures do |path|
              touch 'existing_file.txt'

              # Set sha1 path checksum
              changes(path) do
                touch 'existing_file.txt'
              end

              changes(path, :use_last_record => true) do
                small_time_difference
                open('existing_file.txt', 'w') { |f| f.write('foo') }
              end

              modified, added, removed = changes(path, :use_last_record => true) do
                touch 'existing_file.txt'
              end

              added.should be_empty
              modified.should be_empty
              removed.should be_empty
            end
          end

          it "adds the path in the paths checksums if just touched - #62" 


          it "deletes the path from the paths checksums" 

        end

        context 'given a hidden file' do
          it 'detects the modified file' 

        end

        context 'given a file mode change' do
          it 'does not detect the mode change' 

        end

        context 'given an existing directory' do
          context 'with recursive option set to true' do
            it 'detects the modified file' 

          end

          context 'with recursive option set to false' do
            it "doesn't detects the modified file" 

          end
        end

        context 'given a directory with subdirectories' do
          it 'detects the modified file' 


          context 'with an ignored subdirectory' do
            it "doesn't detect the modified files in neither the directory nor the subdirectory" 

          end
        end
      end

      context 'when a file is moved' do
        it 'detects the file movement' 


        context 'given an existing directory' do
          context 'with recursive option set to true' do
            it 'detects the file movement into the directory' 


            it 'detects a file movement out of the directory' 


            it 'detects a file movement between two directories' 

          end

          context 'with recursive option set to false' do
            it "doesn't detect the file movement into the directory" 


            it "doesn't detect a file movement out of the directory" 


            it "doesn't detect a file movement between two directories" 


            context 'given a directory with subdirectories' do
              it 'detects a file movement between two subdirectories' 


              context 'with an ignored subdirectory' do
                it "doesn't detect the file movement between subdirectories" 

              end
            end

            context 'with all paths passed as params' do
              it 'detects the file movement into the directory' 


              it 'detects a file moved outside of a directory' 


              it 'detects a file movement between two directories' 

            end
          end
        end
      end

      context 'when a file is deleted' do
        it 'detects the file removal' 


        it "deletes the file from the record" 


        it "deletes the path from the paths checksums" 


        context 'given an existing directory' do
          context 'with recursive option set to true' do
            it 'detects the file removal' 

          end

          context 'with recursive option set to false' do
            it "doesn't detect the file removal" 

          end
        end

        context 'given a directory with subdirectories' do
          it 'detects the file removal in subdirectories' 


          context 'with an ignored subdirectory' do
            it "doesn't detect files removals in neither the directory nor its subdirectories" 

          end
        end
      end
    end

    context 'multiple file operations' do
      it 'detects the added files' 


      it 'detects the modified files' 


      it 'detects the removed files' 

    end

    context 'single directory operations' do
      it 'detects a moved directory' 


      it 'detects a removed directory' 


      it "deletes the directory from the record" 


      context 'with nested paths' do
        it 'detects removals without crashing - #18' 

      end
    end

    context 'with a path outside the directory for which a record is made' do
      it "skips that path and doesn't check for changes" 

    end

    context 'with the relative_paths option set to false' do
      it 'returns full paths in the changes hash' 

    end

    context 'within a directory containing unreadble paths - #32' do
      it 'detects changes more than a second apart' 


      context 'with multiple changes within the same second' do
        before { ensure_same_second }

        it 'does not detect changes even if content changes', :unless => described_class::HIGH_PRECISION_SUPPORTED do
          fixtures do |path|
            touch 'unreadable_file.txt'

            modified, added, removed = changes(path) do
              open('unreadable_file.txt', 'w') { |f| f.write('foo') }
              chmod 000, 'unreadable_file.txt'
            end

            added.should be_empty
            modified.should be_empty
            removed.should be_empty
          end
        end
      end
    end

    context 'within a directory containing a removed file - #39' do
      it 'does not raise an exception when hashing a removed file' 

    end

    context 'within a directory containing a unix domain socket file', :unless => windows? do
      it 'does not raise an exception when hashing a unix domain socket file' 

    end

    context 'with symlinks', :unless => windows? do
      it 'looks at symlinks not their targets' 


      it 'handles broken symlinks' 

    end
  end
end

