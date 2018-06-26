/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.boundary;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import org.eclipse.microprofile.health.Health;
import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.controller.MarcaFacadeLocal;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.entity.Marca;

/**
 *
 * @author rcarlos
 */
@Health
@ApplicationScoped
@Path("marca")
public class MarcaResource implements HealthCheck {

    @EJB
    private MarcaFacadeLocal mfl;

//    @GET
//    @Path("findbyname/{marcabuscada}")
//    @Produces({MediaType.APPLICATION_JSON + "; charset=utf-8"})
//    public Response findByNombreLike(
//            @PathParam("marcabuscada") String nombre
//    ) {
//
//        if (mfl != null) {
//            try {
//                List<Marca> list = null;
//                list = mfl.findByNombreLike(nombre);
//                if (list != null && !list.isEmpty()) {
//                    JsonArrayBuilder ab = Json.createArrayBuilder();
//                    for (Marca marca : list) {
//                        ab.add(Json.createObjectBuilder()
//                                .add("idMarca", marca.getIdMarca())
//                                .add("nombre", marca.getNombre()));
//                    }
//                    return Response.ok(ab.build()).build();
//
//                }
//            } catch (Exception ex) {
//                Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
//            }
//        }
//        return Response.status(Response.Status.NOT_FOUND).header("filter-not-found", nombre).build();
//    }
    
    @GET
    @Path("all")
    @Produces({MediaType.APPLICATION_JSON + "; charset=utf-8"})
    public List<Marca> findAll() {
        if (mfl != null) {
            try {
                List<Marca> list = null;
                list = mfl.findAll();
                if (list != null) {
                    return list;
                }
            } catch (Exception ex) {
                Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
        return new ArrayList<>();
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON + "; charset=utf-8"})
    public List<Marca> findRange(
            @DefaultValue("0") @QueryParam("first") int first,
            @DefaultValue("5") @QueryParam("pagesize") int pageSize
    ) {
        if (mfl != null && first >= 0 && pageSize >= 0) {
            try {
                List salida = null;
                salida = mfl.findRange(first, pageSize);
                if (salida != null) {
                    return salida;
                }
            } catch (Exception ex) {
                Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
        return new ArrayList<>();
    }

    @GET
    @Path("count")
    @Produces({MediaType.TEXT_PLAIN})
    public Integer count() {
        if (mfl != null) {
            try {
                return mfl.count();
            } catch (Exception ex) {
                Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
        return 0;
    }

    @Override
    public HealthCheckResponse call() {
        if (mfl.check()==1) {
            return HealthCheckResponse.named("successful-check").withData("mantenimiento", "marca").up().build();
        }else{
            return HealthCheckResponse.named("successful-check").withData("mantenimiento", "marca").down().build();
        }
    }
}
