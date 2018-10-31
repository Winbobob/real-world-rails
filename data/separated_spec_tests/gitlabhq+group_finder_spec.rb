# frozen_string_literal: true

require 'spec_helper'

describe Autocomplete::GroupFinder do
  let(:user) { create(:user) }

  describe '#execute' do
    context 'with a project' do
      it 'returns nil' 

    end

    context 'without a group ID' do
      it 'returns nil' 

    end

    context 'with an empty String as the group ID' do
      it 'returns nil' 

    end

    context 'without a project and with a group ID' do
      it 'raises ActiveRecord::RecordNotFound if the group does not exist' 


      it 'raises ActiveRecord::RecordNotFound if the user can not read the group' 


      it 'raises ActiveRecord::RecordNotFound if an anonymous user can not read the group' 


      it 'returns the group if it exists and is readable' 

    end
  end
end

