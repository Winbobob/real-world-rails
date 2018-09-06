require_relative 'spec_helper'

# Note: this spec test helps checking all gems CHANGELOG.mds 
# are well formated in case invalid manual changes are introduced

def gem_paths
  gems_dir = File.expand_path("../../../gems/", __FILE__)
  Dir.glob("#{gems_dir}/aws-sdk-*/").sort
end

def log_paths
  gem_paths.map{|gem_dir| gem_dir << "CHANGELOG.md"}
end

describe "ensures CHANGELOG.md presents for each gem" do

  gem_paths.each do |path|
    it "#{path} must have a CHANELOG.md" 

  end

end

describe "ensures CHANGELOG.md has valid section ordering" do

  gem_paths.each do |path|
    file = File.open("#{path}CHANGELOG.md", 'r', encoding: 'UTF-8') { |f| f.read }
    version_file = File.open("#{path}VERSION", 'r', encoding: 'UTF-8') { |f| f.read }
    lines = file.lines.to_a
    version = version_file.lines.to_a

    it "#{path}CHANGELOG.md starts with 'Unreleased Changes' section" 


    first_version = file.lines.find {|l| l.match(/\d\.\d+\.\d.*/) }
    it "#{path}CHANGLOG.md follows with current version section" 

  end

end

describe "ensures CHANGELOG.md has parsable entries" do

  let(:skip_pattern) { /(------------------\n|Unreleased Changes\n|\d\.\d+\.\d.*)/ }
  let(:entry_pattern) { /(\*\sFeature\s-\s\w+|\*\sIssue\s-\s\w+)/ }

  log_paths.each do |path|
    it "#{path} has parsable changlog entries" 

  end

end

