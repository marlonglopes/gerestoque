require 'spec_helper'

describe "grupos/new.html.erb" do
  before(:each) do
    assign(:grupo, stub_model(Grupo,
      :codigo => 1,
      :descricao => "MyString"
    ).as_new_record)
  end

  it "renders new grupo form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => grupos_path, :method => "post" do
      assert_select "input#grupo_codigo", :name => "grupo[codigo]"
      assert_select "input#grupo_descricao", :name => "grupo[descricao]"
    end
  end
end
