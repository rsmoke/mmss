module GendersHelper

  def gender_description(id)
    Gender.find(id).name
  end

end
