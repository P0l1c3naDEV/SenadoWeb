/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soap;

/**
 *
 * @author Raphael Policena
 */
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import model.Contratos;
 
@WebService
@SOAPBinding(style = Style.RPC)
public interface SoapWS {    
    @WebMethod String getXmlStringContratos();
    @WebMethod String getXmlString();
    @WebMethod String getXmlStringSugar();
}
