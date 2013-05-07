require 'spec_helper'

describe "girls/new" do
  before(:each) do
    assign(:girl, stub_model(Girl,
      :name => "MyString",
      :age => 1,
      :price => 1,
      :desc => "MyText",
      :bwh => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new girl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", girls_path, "post" do
      assert_select "input#girl_name[name=?]", "girl[name]"
      assert_select "input#girl_age[name=?]", "girl[age]"
      assert_select "input#girl_price[name=?]", "girl[price]"
      assert_select "textarea#girl_desc[name=?]", "girl[desc]"
      assert_select "input#girl_bwh[name=?]", "girl[bwh]"
      assert_select "input#girl_state[name=?]", "girl[state]"
    end
  end
end
