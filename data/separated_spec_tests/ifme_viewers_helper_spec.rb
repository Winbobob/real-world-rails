describe ViewersHelper do
  describe '#number_of_viewers' do
    let(:owner_id) { 1 }

    let!(:viewers) do
      users = viewer_count.times.map do |i|
        create :user1, name: "Viewer #{i}"
      end
      users.map(&:id)
    end
    subject { number_of_viewers(current_user_id, owner_id, viewers) }

    context 'when current_user_is_owner is true' do
      let(:current_user_id) { 1 }

      context 'and when number of viewers is 0' do
        let(:viewer_count) { 0 }

        it 'says there are no viewers' 

      end

      context 'and when number of viewers is 1' do
        let(:viewer_count) { 1 }

        it 'lists the one viewer' 

      end

      context 'and when number of viewers is 2' do
        let(:viewer_count) { 2 }

        it "lists the two viewers' names" 

      end

      context 'and when number of viewers is more than 2' do
        let(:viewer_count) { 3 }

        it "lists all the viewers' names" 

      end
    end

    context 'when current_user_is_owner is false' do
      let(:current_user_id) { 6 }

      context 'and when viewer is the only viewer' do
        let(:viewer_count) { 1 }

        it 'says you are the only viewer' 

      end

      context 'and when viewer is not the only viewer' do
        let(:viewer_count) { 2 }

        it 'says you are not the only viewer' 

      end
    end
  end

  describe "viewers_hover" do
    it "displays only you when there are no viewers without link" 


    it "displays only you when there are no viewers with link" 


    it "displays list of viewers without link" 


    it "displays list of viewers with link" 

  end

  describe "get_viewers_for" do
    it "returns empty array for invalid input" 


    it "returns array of size 1 for valid input of data type category" 


    it "returns array of size 2 for valid input of data type category" 


    it "returns array of size 1 for valid input of data type mood" 


    it "returns array of size 2 for valid input of data type mood" 


    it "returns array of size 1 for valid input of data type strategy" 


    it "returns array of size 2 for valid input of data type strategy" 

  end
end

