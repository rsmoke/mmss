require 'rails_helper'

RSpec.describe "recuploads/index", type: :view do
  before(:each) do
    assign(:recuploads, [
      Recupload.create!(
        :letter => "MyText",
        :authorname => "Authorname",
        :studentname => "Studentname",
        :recommendation => nil
      ),
      Recupload.create!(
        :letter => "MyText",
        :authorname => "Authorname",
        :studentname => "Studentname",
        :recommendation => nil
      )
    ])
  end

  it "renders a list of recuploads" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Authorname".to_s, :count => 2
    assert_select "tr>td", :text => "Studentname".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
