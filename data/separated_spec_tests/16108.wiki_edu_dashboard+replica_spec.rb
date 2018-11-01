# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/replica"

describe Replica do
  let(:en_wiki) { Wiki.get_or_create(language: 'en', project: 'wikipedia') }

  describe 'API requests' do
    it 'returns revisions from this term' 


    it 'works for users with a reserved url characters in the name' 


    it 'returns system parameter for dashboard edits' 


    it 'returns a list of existing articles' 


    it 'functions identically on non-English wikis' 


    it 'functions identically on wikidata' 


    it 'functions identically on multilingual wikisource' 


    it 'functions identically on wikimedia incubator' 


    it 'functions identically on Wikimedia Commons' 

  end

  describe 'error handling' do
    let(:all_users) do
      [build(:user, username: 'ELE427'),
       build(:user, username: 'Ragesoss'),
       build(:user, username: 'Mrbauer1234')]
    end
    let(:rev_start) { 2014_01_01_003430 }
    let(:rev_end) { 2014_12_31_003430 }
    let(:subject) { described_class.new(en_wiki).get_revisions(all_users, rev_start, rev_end) }

    it 'handles timeout errors' 


    it 'handles connection refused errors' 


    it 'handles failed queries' 


    it 'handles successful empty responses' 

  end

  describe 'post request error handling' do
    article_titles = []
    let(:result) { described_class.new(en_wiki).post_existing_articles_by_title(article_titles) }

    it 'handles timeout errors' 


    it 'handles connection refused errors' 


    it 'handles failed queries' 


    it 'handles successful empty responses' 

  end
end

