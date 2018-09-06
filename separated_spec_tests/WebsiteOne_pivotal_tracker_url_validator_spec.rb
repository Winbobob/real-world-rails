require 'spec_helper'

describe PivotalTrackerUrlValidator do
  let(:dummy_class) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :pivotaltracker_url
      validates_with PivotalTrackerUrlValidator
    end
  end

  subject { dummy_class.new }

  ['https://www.pivotaltracker.com/s/projects/982890',
   'https://www.pivotaltracker.com/n/projects/982890'].each do |valid_url|
    it 'should be valid for a valid pivotal project url' 

  end

end

