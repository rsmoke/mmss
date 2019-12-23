require 'rails_helper'

RSpec.describe "recuploads/new", type: :view do
  before(:each) do
    assign(:recupload, Recupload.new(
      :letter => "MyText",
      :authorname => "MyString",
      :studentname => "MyString",
      :recommendation => nil
    ))
  end

  it "renders new recupload form" do
    render

    assert_select "form[action=?][method=?]", recuploads_path, "post" do

      assert_select "textarea[name=?]", "recupload[letter]"

      assert_select "input[name=?]", "recupload[authorname]"

      assert_select "input[name=?]", "recupload[studentname]"

      assert_select "input[name=?]", "recupload[recommendation_id]"
    end
  end
end
