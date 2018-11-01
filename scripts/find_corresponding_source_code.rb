require 'find'
require 'fileutils'

# pdf_file_paths = []
# Find.find('path/to/search') do |path|
#   pdf_file_paths << path if path =~ /.*\.pdf$/
# end
number = 0
is_found = false

Dir['../data/separated_spec_tests/*.rb'].each_with_index do |path, index|
  print '.' if index % 100 == 0
  test_file_name = path.split('/')[3]
  repo_name_with_number = test_file_name.split('+')[0]
  number = repo_name_with_number.split('.')[0]
  repo_name = repo_name_with_number.split('.')[1]
  source_file_name = test_file_name.split('+')[1][0..-9]
  begin
    Find.find("../apps/#{repo_name}") do |p|
      if p.include? source_file_name
        is_found = true
        FileUtils.cp(p, '../data/corresponding_sourse_files/')
        ruby_file_name = p.split('/').last
        FileUtils.mv("../data/corresponding_sourse_files/#{ruby_file_name}",
                     "../data/corresponding_sourse_files/#{number}.#{ruby_file_name}")
        break
      end
    end

    if is_found
      is_found = false
      next
    end
    
    Find.find("../engines/#{repo_name}") do |p|
      if p.include? source_file_name
        FileUtils.cp(p, '../data/corresponding_sourse_files/')
        ruby_file_name = p.split('/').last
        FileUtils.mv("../data/corresponding_sourse_files/#{ruby_file_name}",
                     "../data/corresponding_sourse_files/#{number}.#{ruby_file_name}")
        break
      end
    end
  rescue
    p source_file_name
    p '==================================='
  end
end