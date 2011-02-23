# encoding: utf-8

require 'soap/wsdlDriver'

module Consomewsghc

	def wsghc(params={})

		id = params[:id] ?  params[:id] : 10000
		param= params[:param] ?  params[:param] : "param^param^param"
		 
		soap = wsdl
		response = soap.GHCGenericFunction(:id => id, :param => param)
		soap.reset_stream
		response.gHCGenericFunctionResult
	end


 private
    def wsdl

		wsdlr = "http://workflow.ghc.com.br/wsghcworkflow/WSGHCWorkflow.asmx?WSDL"
		wsdll = "http://130.158.1.41/WSGHCWorkflow/WSGHCWorkflow.asmx?WSDL"

		SOAP::WSDLDriverFactory.new(wsdll).create_rpc_driver
    end
end


