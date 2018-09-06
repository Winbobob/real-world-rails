describe TabularData::Column do
  describe '#initialize' do
    context '#header' do
      it 'uses the specified header, if present' 


      it 'falls back to the titleized column name' 

    end

    context '#formatter' do
      it 'uses the specified formatter, if present' 


      it 'falls back to :none' 

    end
  end

  describe '#can_sort?' do
    it 'prevents virtual fields from being sorted' 


    it 'allows other fields to be sorted' 

  end

  describe '#sort' do
    let (:col) { TabularData::Column.new('aaa', 'proposals.aaa') }
    it 'starts with no sort' 


    it 'allows ascending sort' 


    it 'allows descending sort' 


    it 'allows sort to be unset' 

  end

  describe '#display' do
    let(:work_order) { create(:ncr_work_order) }

    it 'accesses fields directly (no display field)' 


    it 'accesses fields directly (display field overrides db)' 


    it 'can read across objects' 

  end
end

