# frozen_string_literal: true

require 'spec_helper'

describe GroupLabelsFinder, '#execute' do
  let!(:group) { create(:group) }
  let!(:user)  { create(:user) }
  let!(:label1) { create(:group_label, title: 'Foo', description: 'Lorem ipsum', group: group) }
  let!(:label2) { create(:group_label, title: 'Bar', description: 'Fusce consequat', group: group) }

  it 'returns all group labels sorted by name if no params' 


  it 'returns all group labels sorted by name desc' 


  it 'returns group labels that match search' 


  it 'returns group labels user subscribed to' 


  it 'returns second page of labels' 

end

