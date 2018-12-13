/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soap;

import control.service.ContratosService;
import control.service.DespesaService;
import javax.jws.WebService;
import javax.jws.WebMethod;

/**
 *
 * @author muril
 */
@WebService(serviceName = "SOAPdespesa")
public class SOAPservices implements SoapWS{
    
    DespesaService serviceDespesa = new DespesaService();
    ContratosService serviceContratos = new ContratosService();
    
    @WebMethod(operationName = "DespesasXml")
    @Override
    public String getXmlString() {
        return serviceDespesa.getXmlString();
    }
    @WebMethod(operationName = "DespesasXmlChaveValor")
    @Override
    public String getXmlStringSugar() {
        return serviceDespesa.getXmlStringSugar();
    }
    @WebMethod(operationName = "ContratosXml")
    @Override
    public String getXmlStringContratos() {
        return serviceContratos.getXmlString();
    }
}
