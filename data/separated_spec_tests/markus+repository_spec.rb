describe Repository::AbstractRepository do
  context 'repository permissions should be updated' do
    context 'exactly once' do
      it 'for a single update' 

      it 'at the end of a batch update' 

      it 'at the end of a batch update only if requested' 

      context 'by the last thread to read from the database' do
        it 'when there are multiple concurrent updates' 

        it 'when there are multiple concurrent batch updates' 

      end
    end
    context 'multiple times' do
      it 'for multiple updates made by the same thread' 

    end
  end
  context 'repository permissions should not be updated' do
    it 'when not in authoritative mode' 

    it 'at the end of a batch update if not requested' 

  end
end

