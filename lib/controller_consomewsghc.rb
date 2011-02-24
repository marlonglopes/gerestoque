# encoding: utf-8

require 'soap/wsdlDriver'

module ControllerConsomewsghc
  def self.included(controller)
    controller.send :helper_method, :wsghc
  end

	def self.wsghc(params={})

#		server = params[:server] ?  params[:server] : "172.16.2.5"
#		uci= params[:uci] ? params[:uci] : "MWS"
#		volgrp= params[:volgrp] ? params[:volgrp] : "MWS"
#		rotina= params[:rotina] ? params[:rotina] : "^webServ"

		id = params[:id] ?  params[:id] : 10000
		param= params[:param] ?  params[:param] : "param^param^param"

		soap = wsdl
		response = soap.do(:server=>"172.16.2.5",:uci=>"MWS",:volgrp=>"MWS",:rotina=>"^webServ",:id => id, :param => param)
		soap.reset_stream
		response.doResult
	end

 private
    def self.wsdl

		wsdlr = "http://workflow.ghc.com.br/wsghcworkflow/WSGHCWorkflow.asmx?WSDL"
		wsdll = "http://130.158.1.41/WSGHCWorkflow/WSGHCWorkflow.asmx?WSDL"
		wsdla = "http://www2.ghc.com.br/WSGHCActivate/MSM.asmx?WSDL"
		wsdlal = "http://172.16.253.5/WSGHCActivate/MSM.asmx?WSDL"
		SOAP::WSDLDriverFactory.new(wsdlal).create_rpc_driver

#		if remote_addr
#			SOAP::WSDLDriverFactory.new(wsdll).create_rpc_driver
#		else
#			SOAP::WSDLDriverFactory.new(wsdlr).create_rpc_driver
#		end

    end

end

