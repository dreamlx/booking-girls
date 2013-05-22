require 'spec_helper'

describe "venues/edit" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "MyString",
      :address => "MyString",
      :contact => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_address[name=?]", "venue[address]"
      assert_select "input#venue_contact[name=?]", "venue[contact]"
      assert_select "textarea#venue_desc[name=?]", "venue[desc]"
    end
  end
end
