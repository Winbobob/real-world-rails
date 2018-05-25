require 'tempfile'
require 'fileutils'

path = './spec_files_without_test_body.txt'
temp_file = Tempfile.new('foo')
num_of_heading_whitespace_of_specification_line = -1
curr_num_of_heading_whitespace = -1
iterator = 0
begin
  File.open('spec_files.txt', 'r') do |file|
    file.each_line do |line|
      print '.' if iterator % 100 == 0
      if line =~ /^\s+it\s['"].*['"]\sdo$/
        temp_file.puts line[0..-4]
        num_of_heading_whitespace_of_specification_line = line[/\A */].size
      elsif num_of_heading_whitespace_of_specification_line != -1
        curr_num_of_heading_whitespace = line[/\A */].size 
        if curr_num_of_heading_whitespace == num_of_heading_whitespace_of_specification_line and line =~ /end/
          temp_file.puts ''
          num_of_heading_whitespace_of_specification_line = -1
        end
      else
        temp_file.puts line
      end
    end
  end
  temp_file.close
  FileUtils.mv(temp_file.path, path)
ensure
  temp_file.close
  temp_file.unlink
end