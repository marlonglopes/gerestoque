require 'spec_helper'

describe "parecers/new.html.erb" do
  before(:each) do
    assign(:parecer, stub_model(Parecer,
      :codigo => 1,
      :descricao => "MyString"
    ).as_new_record)
  end

  it "renders new parecer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => parecers_path, :method => "post" do
      assert_select "input#parecer_codigo", :name => "parecer[codigo]"
      assert_select "input#parecer_descricao", :name => "parecer[descricao]"
    end
  end
end
