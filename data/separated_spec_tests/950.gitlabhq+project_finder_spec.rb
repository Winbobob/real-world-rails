# frozen_string_literal: true

require 'spec_helper'

describe Autocomplete::ProjectFinder do
  let(:user) { create(:user) }

  describe '#execute' do
    context 'without a project ID' do
      it 'returns nil' 

    end

    context 'with an empty String as the project ID' do
      it 'returns nil' 

    end

    context 'with a project ID' do
      it 'raises ActiveRecord::RecordNotFound if the project does not exist' 


      it 'raises ActiveRecord::RecordNotFound if the user can not read the project' 


      it 'raises ActiveRecord::RecordNotFound if an anonymous user can not read the project' 


      it 'returns the project if it exists and is readable' 

    end
  end
end

