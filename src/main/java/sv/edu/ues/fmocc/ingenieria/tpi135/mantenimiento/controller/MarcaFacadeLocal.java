/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.controller;

import java.util.List;
import javax.ejb.Local;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.entity.Marca;

/**
 *
 * @author rcarlos
 */
@Local
public interface MarcaFacadeLocal {

    void create(Marca marca);

    void edit(Marca marca);

    void remove(Marca marca);

    Marca find(Object id);

    List<Marca> findAll();

    List<Marca> findRange(int first, int range);

    int count();

    int check();

}
