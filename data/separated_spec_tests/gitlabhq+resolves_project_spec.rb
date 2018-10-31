require 'spec_helper'

describe Mutations::ResolvesProject do
  let(:mutation_class) do
    Class.new(Mutations::BaseMutation) do
      include Mutations::ResolvesProject
    end
  end

  let(:context) { double }
  subject(:mutation) { mutation_class.new(object: nil, context: context) }

  it 'uses the ProjectsResolver to resolve projects by path' 

end

