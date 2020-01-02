module DemographicsHelper
  def demographic_description(id)
    Demographic.find(id).name
  end

end
