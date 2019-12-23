require 'rails_helper'

RSpec.describe "recuploads/edit", type: :view do
  before(:each) do
    @recupload = assign(:recupload, Recupload.create!(
      :letter => "MyText",
      :authorname => "MyString",
      :studentname => "MyString",
      :recommendation => nil
    ))
  end

  it "renders the edit recupload form" do
    render

    assert_select "form[action=?][method=?]", recupload_path(@recupload), "post" do

      assert_select "textarea[name=?]", "recupload[letter]"

      assert_select "input[name=?]", "recupload[authorname]"

      assert_select "input[name=?]", "recupload[studentname]"

      assert_select "input[name=?]", "recupload[recommendation_id]"
    end
  end
end
