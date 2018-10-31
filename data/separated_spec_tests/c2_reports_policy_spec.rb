describe ReportPolicy do
  permissions :can_show? do
    it "allows the owner to see it" 


    it "allows shared report to be viewed by user with same client_slug" 

  end

  permissions :can_preview? do
    it "allows the owner to send a copy via email" 


    it "allows anyone who can see it to send a copy via email" 

  end

  permissions :can_destroy? do
    it "allows the owner to destroy" 


    it "shared report only destroy-able by owner" 

  end
end

