require 'tempfile'
require 'fileutils'

path = ''
temp_file = Tempfile.new('foo')
iterator = 1
begin
  File.open('../data/spec_files_without_test_body.rb', 'r') do |file|
    file.each_line do |line|
      print '.' if iterator % 100 == 0
      if line =~ /^File:.*\_spec\.rb$/
        if path.length > 0
          temp_file.close
          if path != 'we do not need feature test in this experiment'
            FileUtils.mv(temp_file.path, path) 
            iterator += 1
          end
          temp_file = Tempfile.new('foo')
        end
        arr = line.split('/')
        path = if line.include? '/spec/features/'
                 'we do not need feature test in this experiment'
               else
                 "../data/separated_spec_tests/#{iterator}.#{arr[1]}+#{arr[-1][0..-2]}"
               end
      else
        temp_file.puts line
      end
    end
  end
ensure
  temp_file.close
  temp_file.unlink
end