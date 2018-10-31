require 'spec_helper'

describe API::Helpers::Pagination do
  let(:resource) { Project.all }

  subject do
    Class.new.include(described_class).new
  end

  describe '#paginate (keyset pagination)' do
    let(:value) { spy('return value') }

    before do
      allow(value).to receive(:to_query).and_return(value)

      allow(subject).to receive(:header).and_return(value)
      allow(subject).to receive(:params).and_return(value)
      allow(subject).to receive(:request).and_return(value)
    end

    context 'when resource can be paginated' do
      let!(:projects) do
        [
          create(:project, name: 'One'),
          create(:project, name: 'Two'),
          create(:project, name: 'Three')
        ].sort_by { |e| -e.id } # sort by id desc (this is the default sort order for the API)
      end

      describe 'first page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ pagination: 'keyset', per_page: 2 })
        end

        it 'returns appropriate amount of resources' 


        it 'returns the first two records (by id desc)' 


        it 'adds appropriate headers' 

      end

      describe 'second page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ pagination: 'keyset', per_page: 2, ks_prev_id: projects[1].id })
        end

        it 'returns appropriate amount of resources' 


        it 'returns the third record' 


        it 'adds appropriate headers' 

      end

      describe 'third page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ pagination: 'keyset', per_page: 2, ks_prev_id: projects[2].id })
        end

        it 'returns appropriate amount of resources' 


        it 'adds appropriate headers' 

      end

      context 'if order' do
        context 'is not present' do
          before do
            allow(subject).to receive(:params)
              .and_return({ pagination: 'keyset', per_page: 2 })
          end

          it 'is not present it adds default order(:id) desc' 

        end

        context 'is present' do
          let(:resource) { Project.all.order(name: :desc) }
          let!(:projects) do
            [
              create(:project, name: 'One'),
              create(:project, name: 'Two'),
              create(:project, name: 'Three'),
              create(:project, name: 'Three'), # Note the duplicate name
              create(:project, name: 'Four'),
              create(:project, name: 'Five'),
              create(:project, name: 'Six')
            ]

            # if we sort this by name descending, id descending, this yields:
            # {
            #   2 => "Two",
            #   4 => "Three",
            #   3 => "Three",
            #   7 => "Six",
            #   1 => "One",
            #   5 => "Four",
            #   6 => "Five"
            # }
            #
            # (key is the id)
          end

          it 'it also orders by primary key' 


          it 'it returns the right records (first page)' 


          it 'it returns the right records (second page)' 


          it 'it returns the right records (third page), note increased per_page' 


          it 'it returns the right link to the next page' 

        end
      end
    end
  end

  describe '#paginate (default offset-based pagination)' do
    let(:value) { spy('return value') }

    before do
      allow(value).to receive(:to_query).and_return(value)

      allow(subject).to receive(:header).and_return(value)
      allow(subject).to receive(:params).and_return(value)
      allow(subject).to receive(:request).and_return(value)
    end

    describe 'required instance methods' do
      let(:return_spy) { spy }

      it 'requires some instance methods' 

    end

    context 'when resource can be paginated' do
      before do
        create_list(:project, 3)
      end

      describe 'first page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ page: 1, per_page: 2 })
        end

        it 'returns appropriate amount of resources' 


        it 'adds appropriate headers' 

      end

      describe 'second page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ page: 2, per_page: 2 })
        end

        it 'returns appropriate amount of resources' 


        it 'adds appropriate headers' 

      end

      context 'if order' do
        it 'is not present it adds default order(:id) if no order is present' 


        it 'is present it does not add anything' 

      end
    end

    context 'when resource empty' do
      describe 'first page' do
        before do
          allow(subject).to receive(:params)
            .and_return({ page: 1, per_page: 2 })
        end

        it 'returns appropriate amount of resources' 


        it 'adds appropriate headers' 

      end
    end
  end

  def expect_header(*args, &block)
    expect(subject).to receive(:header).with(*args, &block)
  end

  def expect_message(method)
    expect(subject).to receive(method)
      .at_least(:once).and_return(value)
  end
end

