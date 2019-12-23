require 'rails_helper'

RSpec.describe "recuploads/show", type: :view do
  before(:each) do
    @recupload = assign(:recupload, Recupload.create!(
      :letter => "MyText",
      :authorname => "Authorname",
      :studentname => "Studentname",
      :recommendation => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Authorname/)
    expect(rendered).to match(/Studentname/)
    expect(rendered).to match(//)
  end
end
