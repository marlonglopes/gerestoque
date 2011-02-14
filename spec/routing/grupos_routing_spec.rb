require "spec_helper"

describe GruposController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/grupos" }.should route_to(:controller => "grupos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/grupos/new" }.should route_to(:controller => "grupos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/grupos/1" }.should route_to(:controller => "grupos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/grupos/1/edit" }.should route_to(:controller => "grupos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/grupos" }.should route_to(:controller => "grupos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/grupos/1" }.should route_to(:controller => "grupos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/grupos/1" }.should route_to(:controller => "grupos", :action => "destroy", :id => "1")
    end

  end
end
