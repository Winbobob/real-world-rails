describe MyAdvisingController do

  describe '#get_feed' do
    context 'no authenticated user' do
      it 'should return empty' 

    end

    context 'authenticated user' do
      before do
        session['user_id'] = '61889'
        # TODO CampusSolutions::Link does not yet have a versatile fake mode.
        allow_any_instance_of(CampusSolutions::Link).to receive(:get_url).and_return({
          link: {url: 'http://www.berkeley.edu'}
        })
      end
      it 'should return a feed full of content' 

    end
  end
end

