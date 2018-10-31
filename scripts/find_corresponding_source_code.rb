require 'find'

# pdf_file_paths = []
# Find.find('path/to/search') do |path|
#   pdf_file_paths << path if path =~ /.*\.pdf$/
# end
Dir["../data/separated_spec_tests/*.rb"].each do |path|
  test_file_name = path.split('/')[3]
  repo_name = test_file_name.split('+')[0]
  source_file_name = test_file_name.split('+')[1][0..-9]
end