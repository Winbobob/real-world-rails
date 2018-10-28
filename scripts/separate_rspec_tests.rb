require 'tempfile'
require 'fileutils'

path = ''
temp_file = Tempfile.new('foo')
iterator = 0
begin
  File.open('../data/spec_files_without_test_body.rb', 'r') do |file|
    file.each_line do |line|
      print '.' if iterator % 100 == 0
      if line =~ /^File:.*\_spec\.rb$/
        if path.length > 0
          temp_file.close
          FileUtils.mv(temp_file.path, path)
          temp_file = Tempfile.new('foo')
        end
        arr = line.split('/');
        path = "../separated_spec_tests/#{arr[1]}_#{arr[-1][0..-2]}"
      else
        temp_file.puts line
      end
      iterator += 1
    end
  end
ensure
  temp_file.close
  temp_file.unlink
end