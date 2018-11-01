require 'spec_helper'

describe Gitlab::LanguageDetection do
  set(:project) { create(:project, :repository) }
  set(:ruby) { create(:programming_language, name: 'Ruby') }
  set(:haskell) { create(:programming_language, name: 'Haskell') }
  let(:repository) { project.repository }
  let(:detection) do
    [{ value: 66.63, label: "Ruby", color: "#701516", highlight: "#701516" },
     { value: 12.96, label: "JavaScript", color: "#f1e05a", highlight: "#f1e05a" },
     { value: 7.9, label: "Elixir", color: "#e34c26", highlight: "#e34c26" },
     { value: 2.51, label: "CoffeeScript", color: "#244776", highlight: "#244776" },
     { value: 1.51, label: "Go", color: "#2a4776", highlight: "#244776" },
     { value: 1.1, label: "MepmepLang", color: "#2a4776", highlight: "#244776" }]
  end
  let(:repository_languages) do
    [RepositoryLanguage.new(share: 10, programming_language: ruby)]
  end

  subject { described_class.new(repository, repository_languages) }

  before do
    allow(repository).to receive(:languages).and_return(detection)
  end

  describe '#languages' do
    it 'returns the language names' 

  end

  describe '#insertions' do
    let(:programming_languages) { [ruby, haskell] }
    let(:detection) do
      [{ value: 10, label: haskell.name, color: haskell.color }]
    end

    it 'only includes new languages' 

  end

  describe '#updates' do
    it 'updates the share of languages' 


    it 'does not include languages to be removed' 


    context 'when silent writes occur' do
      let(:repository_languages) do
        [RepositoryLanguage.new(share: 66.63, programming_language: ruby)]
      end

      it "doesn't include them in the result" 

    end
  end

  describe '#deletions' do
    let(:repository_languages) do
      [RepositoryLanguage.new(share: 10, programming_language: ruby),
       RepositoryLanguage.new(share: 5, programming_language: haskell)]
    end

    it 'lists undetected languages' 

  end
end

