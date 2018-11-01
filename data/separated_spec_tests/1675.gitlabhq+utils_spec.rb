require 'spec_helper'

describe Gitlab::Utils do
  delegate :to_boolean, :boolean_to_yes_no, :slugify, :random_string, :which, :ensure_array_from_string,
   :bytes_to_megabytes, to: :described_class

  describe '.slugify' do
    {
      'TEST' => 'test',
      'project_with_underscores' => 'project-with-underscores',
      'namespace/project' =>  'namespace-project',
      'a' * 70 => 'a' * 63,
      'test_trailing_' => 'test-trailing'
    }.each do |original, expected|
      it "slugifies #{original} to #{expected}" 

    end
  end

  describe '.remove_line_breaks' do
    using RSpec::Parameterized::TableSyntax

    where(:original, :expected) do
      "foo\nbar\nbaz"     | "foobarbaz"
      "foo\r\nbar\r\nbaz" | "foobarbaz"
      "foobar"            | "foobar"
    end

    with_them do
      it "replace line breaks with an empty string" 

    end
  end

  describe '.to_boolean' do
    it 'accepts booleans' 


    it 'converts a valid string to a boolean' 


    it 'converts an invalid string to nil' 

  end

  describe '.boolean_to_yes_no' do
    it 'converts booleans to Yes or No' 

  end

  describe '.random_string' do
    it 'generates a string' 

  end

  describe '.which' do
    it 'finds the full path to an executable binary' 

  end

  describe '.ensure_array_from_string' do
    it 'returns the same array if given one' 


    it 'turns comma-separated strings into arrays' 

  end

  describe '.bytes_to_megabytes' do
    it 'converts bytes to megabytes' 

  end
end

