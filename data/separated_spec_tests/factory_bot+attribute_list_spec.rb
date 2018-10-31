describe FactoryBot::AttributeList, "#define_attribute" do
  it "maintains a list of attributes" 


  it "returns the attribute" 


  it "raises if an attribute has already been defined" 

end

describe FactoryBot::AttributeList, "#define_attribute with a named attribute list" do
  subject { FactoryBot::AttributeList.new(:author) }

  let(:association_with_same_name)      { FactoryBot::Attribute::Association.new(:author, :author, {}) }
  let(:association_with_different_name) { FactoryBot::Attribute::Association.new(:author, :post, {}) }

  it "raises when the attribute is a self-referencing association" 


  it "does not raise when the attribute is not a self-referencing association" 

end

describe FactoryBot::AttributeList, "#apply_attributes" do
  def list(*attributes)
    FactoryBot::AttributeList.new.tap do |list|
      attributes.each { |attribute| list.define_attribute(attribute) }
    end
  end

  it "adds attributes in the order defined" 

end

describe FactoryBot::AttributeList, "#associations" do
  let(:email_attribute) do
    FactoryBot::Attribute::Dynamic.new(:email, false, ->(u) { "#{u.full_name}@example.com" })
  end
  let(:author_attribute)    { FactoryBot::Attribute::Association.new(:author, :user, {}) }
  let(:profile_attribute)   { FactoryBot::Attribute::Association.new(:profile, :profile, {}) }

  before do
    subject.define_attribute(email_attribute)
    subject.define_attribute(author_attribute)
    subject.define_attribute(profile_attribute)
  end

  it "returns associations" 

end

describe FactoryBot::AttributeList, "filter based on ignored attributes" do
  def build_ignored_attribute(name)
    FactoryBot::Attribute::Dynamic.new(name, true, -> { "value" })
  end

  def build_non_ignored_attribute(name)
    FactoryBot::Attribute::Dynamic.new(name, false, -> { "value" })
  end

  before do
    subject.define_attribute(build_ignored_attribute(:comments_count))
    subject.define_attribute(build_ignored_attribute(:posts_count))
    subject.define_attribute(build_non_ignored_attribute(:email))
    subject.define_attribute(build_non_ignored_attribute(:first_name))
    subject.define_attribute(build_non_ignored_attribute(:last_name))
  end

  it "filters #ignored attributes" 


  it "filters #non_ignored attributes" 

end

describe FactoryBot::AttributeList, "generating names" do
  def build_ignored_attribute(name)
    FactoryBot::Attribute::Dynamic.new(name, true, -> { "value" })
  end

  def build_non_ignored_attribute(name)
    FactoryBot::Attribute::Dynamic.new(name, false, -> { "value" })
  end

  def build_association(name)
    FactoryBot::Attribute::Association.new(name, :user, {})
  end

  before do
    subject.define_attribute(build_ignored_attribute(:comments_count))
    subject.define_attribute(build_ignored_attribute(:posts_count))
    subject.define_attribute(build_non_ignored_attribute(:email))
    subject.define_attribute(build_non_ignored_attribute(:first_name))
    subject.define_attribute(build_non_ignored_attribute(:last_name))
    subject.define_attribute(build_association(:avatar))
  end

  it "knows all its #names" 


  it "knows all its #names for #ignored attributes" 


  it "knows all its #names for #non_ignored attributes" 


  it "knows all its #names for #associations" 

end

