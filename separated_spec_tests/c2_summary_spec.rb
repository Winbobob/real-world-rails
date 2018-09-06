describe "Summary page" do
  it "lists all subtotals correctly" 


  it "names the rows correctly" 

end

def create_proposals(status_counts)
  status_counts.each do |status, count|
    count.times do
      nwo = create(:ncr_work_order)
      nwo.proposal.update(status: status)
    end
  end
end

