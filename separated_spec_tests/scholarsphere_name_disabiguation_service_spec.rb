# frozen_string_literal: true

require 'rails_helper'

describe NameDisambiguationService, unless: travis? do
  subject { described_class.new(name).disambiguate }

  context 'when we have a normal name' do
    let(:name) { 'Thompson, Britta M' }

    it 'finds the user' 

  end

  context 'when we have an id' do
    let(:name) { 'cam156' }

    it 'finds the ids' 

  end

  context 'when we have multiple combined with an and' do
    let(:name) { 'Carolyn Cole and Adam Wead' }

    it 'finds both users' 

  end

  context 'when we have initials for first name' do
    let(:name) { 'K.B. Baker' }

    it 'finds the user' 

  end

  context 'when we have multiple results' do
    let(:name) { 'Jane Doe' }

    it 'finds the user' 

  end

  context 'when the user has many titles' do
    let(:name) { 'Nicole Seger, MSN, RN, CPN' }

    it 'finds the user' 

  end

  context 'when the user has a title first' do
    let(:name) { 'MSN Deb Cardenas' }

    it 'finds the user' 

  end

  context 'when the user has strange characters' do
    let(:name) { 'Adam Garner Wead *' }

    it 'cleans the name' 

  end

  context 'when the user has an apostrophy' do
    let(:name) { "Anthony R. D'Augelli" }

    it 'finds the user' 

  end

  context 'when the user has many names' do
    let(:name) { 'ALIDA HEATHER DOHN ROSS' }

    it 'finds the user' 

  end

  context 'when the user has additional information' do
    let(:name) { 'Cole, Carolyn (Kubicki Group)' }

    it 'cleans the name' 

  end

  context 'when the user has an email in thier name' do
    context 'when the email is not their id' do
      let(:name) { 'Barbara I. Dewey a bdewey@psu.edu' }

      it 'does not find the user' 

    end

    context 'when the email is their id' do
      let(:name) { 'sjs230@psu.edu' }

      it 'finds the user' 

    end

    context 'when the email is their id' do
      let(:name) { 'sjs230@psu.edu, cam156@psu.edu' }

      it 'finds the user' 

    end
  end
end

