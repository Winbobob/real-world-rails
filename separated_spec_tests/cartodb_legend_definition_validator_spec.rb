# encoding: utf-8

require 'spec_helper_min'

module Carto
  describe LegendDefinitionValidator do
    let(:random_definition) do
      {
        hey: 'teacher',
        leave: {
          the: 'kids alone'
        }
      }.with_indifferent_access
    end

    let(:bubble_definition) do
      definition_location = "#{Rails.root}/lib/formats/legends/definitions/bubble.json"
      Carto::Definition.instance
                       .load_from_file(definition_location)
    end

    describe '#bubble' do
      let(:definition) do
        {
          color: '#fff'
        }
      end

      it 'accepts a correct definition' 


      it 'rejects spammy definitions' 


      it 'rejects incomplete definitions' 


      it 'rejects wrongly formatted colors' 

    end

    describe '#choropleth' do
      let(:definition) do
        {
          prefix: "123",
          suffix: "foo"
        }
      end

      it 'accepts a correct definition' 


      it 'rejects spammy definitions' 


      it 'doesn\'t reject incomplete definitions' 

    end

    describe '#custom' do
      let(:definition) do
        {
          categories: [
            { title: 'Manolo Escobar' },
            { title: 'Manolo Escobar', color: '#fff' },
            { title: 'Manolo Escobar', icon: 'super.png' },
            { title: 'Manolo Escobar', icon: 'super.png', color: '#fff' }
          ]
        }
      end

      it 'accepts a correct definition' 


      it 'rejects spammy definitions' 


      it 'rejects incomplete definitions' 


      describe 'categories' do
        it 'rejects spammy definitions' 


        it 'rejects incomplete definitions' 


        it 'rejects wrongly formatted colors' 

      end
    end

    describe '#category' do
      let(:definition) do
        {}
      end

      it 'accepts a correct definition' 


      it 'rejects spammy definitions' 

    end

    describe '#errors' do
      it 'handles non defined schemas' 


      it 'handles invalid definitions' 


      it 'performs validations' 


      it 'is memoized' 

    end

    describe '#location' do
      it 'returns nil for inexistent locations' 


      it 'returns location for existent locations' 


      it 'returns location for existent locations when type is string' 


      it 'is memoized' 

    end
  end
end

