require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category,
      :name => "MyString",
      :parent_id => 1,
      :lft => 1,
      :rgt => 1,
      :depth => 1
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", categories_path, "post" do
      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "input#category_parent_id[name=?]", "category[parent_id]"
      assert_select "input#category_lft[name=?]", "category[lft]"
      assert_select "input#category_rgt[name=?]", "category[rgt]"
      assert_select "input#category_depth[name=?]", "category[depth]"
    end
  end
end
