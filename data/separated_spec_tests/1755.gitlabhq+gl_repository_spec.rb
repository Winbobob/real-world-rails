require 'spec_helper'

describe ::Gitlab::GlRepository do
  describe '.parse' do
    set(:project) { create(:project, :repository) }

    it 'parses a project gl_repository' 


    it 'parses a wiki gl_repository' 


    it 'throws an argument error on an invalid gl_repository' 

  end
end

