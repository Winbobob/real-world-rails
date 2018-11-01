require 'spec_helper'

describe Resolvers::ProjectResolver do
  include GraphqlHelpers

  set(:project1) { create(:project) }
  set(:project2) { create(:project) }

  set(:other_project) { create(:project) }

  describe '#resolve' do
    it 'batch-resolves projects by full path' 


    it 'resolves an unknown full_path to nil' 

  end

  def resolve_project(full_path)
    resolve(described_class, args: { full_path: full_path })
  end
end

