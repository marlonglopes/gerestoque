require 'spec_helper'

describe ParecersController do

  def mock_parecer(stubs={})
    (@mock_parecer ||= mock_model(Parecer).as_null_object).tap do |parecer|
      parecer.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all parecers as @parecers" do
      Parecer.stub(:all) { [mock_parecer] }
      get :index
      assigns(:parecers).should eq([mock_parecer])
    end
  end

  describe "GET show" do
    it "assigns the requested parecer as @parecer" do
      Parecer.stub(:find).with("37") { mock_parecer }
      get :show, :id => "37"
      assigns(:parecer).should be(mock_parecer)
    end
  end

  describe "GET new" do
    it "assigns a new parecer as @parecer" do
      Parecer.stub(:new) { mock_parecer }
      get :new
      assigns(:parecer).should be(mock_parecer)
    end
  end

  describe "GET edit" do
    it "assigns the requested parecer as @parecer" do
      Parecer.stub(:find).with("37") { mock_parecer }
      get :edit, :id => "37"
      assigns(:parecer).should be(mock_parecer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created parecer as @parecer" do
        Parecer.stub(:new).with({'these' => 'params'}) { mock_parecer(:save => true) }
        post :create, :parecer => {'these' => 'params'}
        assigns(:parecer).should be(mock_parecer)
      end

      it "redirects to the created parecer" do
        Parecer.stub(:new) { mock_parecer(:save => true) }
        post :create, :parecer => {}
        response.should redirect_to(parecer_url(mock_parecer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved parecer as @parecer" do
        Parecer.stub(:new).with({'these' => 'params'}) { mock_parecer(:save => false) }
        post :create, :parecer => {'these' => 'params'}
        assigns(:parecer).should be(mock_parecer)
      end

      it "re-renders the 'new' template" do
        Parecer.stub(:new) { mock_parecer(:save => false) }
        post :create, :parecer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested parecer" do
        Parecer.should_receive(:find).with("37") { mock_parecer }
        mock_parecer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :parecer => {'these' => 'params'}
      end

      it "assigns the requested parecer as @parecer" do
        Parecer.stub(:find) { mock_parecer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:parecer).should be(mock_parecer)
      end

      it "redirects to the parecer" do
        Parecer.stub(:find) { mock_parecer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(parecer_url(mock_parecer))
      end
    end

    describe "with invalid params" do
      it "assigns the parecer as @parecer" do
        Parecer.stub(:find) { mock_parecer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:parecer).should be(mock_parecer)
      end

      it "re-renders the 'edit' template" do
        Parecer.stub(:find) { mock_parecer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested parecer" do
      Parecer.should_receive(:find).with("37") { mock_parecer }
      mock_parecer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the parecers list" do
      Parecer.stub(:find) { mock_parecer }
      delete :destroy, :id => "1"
      response.should redirect_to(parecers_url)
    end
  end

end
