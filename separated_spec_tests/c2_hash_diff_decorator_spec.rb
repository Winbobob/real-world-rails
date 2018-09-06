describe HashDiffDecorator do
  describe '.html_for' do
    it "renders add events" 


    it "renders modification events" 


    it "renders removal events" 


    it "renders original-was-nil events" 


    it "renders original-was-empty-string events" 


    it "renders numeric events" 


    context "when the change includes an object value" do
      context "and the object can translate keys" do
        it "translates object keys" 

      end

      context "and the object cannot translate keys" do
        it "prints the raw field name from the change" 

      end
    end
  end
end

def work_order
  create(:ncr_work_order).decorate
end

