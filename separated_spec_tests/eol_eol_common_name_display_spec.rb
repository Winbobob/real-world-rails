require "spec_helper"

describe EOL::CommonNameDisplay do

  before(:all) do
    load_foundation_cache
    Language.gen_if_not_exists(iso_639_1: 'en')
    Language.gen_if_not_exists(label: 'Unknown')
    Hierarchy.gen_if_not_exists(label: "Encyclopedia of Life Contributors")
    Visibility.gen_if_not_exists(label: 'visible')
    @fake_name = fake_name
    @cnd = EOL::CommonNameDisplay.new(@fake_name)
  end

  it 'should build a last of CNDs by taxon concept id, ignoring duplicate names' 


  it 'should be created with a special variant of Name' 

  
  it 'should sort based on name_string' 

  
  it 'should remove duplicates' 

  
  it 'should merge sources on duplicates' 


end

# NOTE - Yes, these YAML outputs are fragile.  But it avoids the database, so it's much faster.  Sorry.  If you change the
# sql, you will have to re-write these tests... but the time you take doing so was saved by all the times this DIDN'T have to
# populate the entire damn DB.  ;)
def fake_name(options = {})
  options[:name_string] ||= 'animals'
  options[:language_id] ||= 152
  name = Name.find_or_create_by_string(options[:name_string])
  syn = Synonym.gen(name: name,
    language_id: options[:language_id], preferred: 1, hierarchy: Hierarchy.eol_contributors)
  TaxonConceptName.gen(synonym: syn, name: name, language_id: options[:language_id], preferred: 1, 
    vern: 1)
#   options[:name_string] ||= 'animals'
#   options[:language_id] ||= 152
#   options[:language_label] ||= 'English'
#   YAML.load(%Q{
# !ruby/object:Name 
#   attributes: 
#     iso_639_1: en
#     preferred: "1"
#     synonym_id: 
#     language_label: #{options[:language_label]}
#     vetted_id: "0"
#     language_id: "#{options[:language_id]}"
#     name_string: #{options[:name_string]}
#     name_id: "841736"
#     language_name: #{options[:language_label]}
#   attributes_cache: {}
#   })
end

