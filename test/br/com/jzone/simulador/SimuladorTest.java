/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jzone.simulador;

import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author carlo
 */
public class SimuladorTest {
    
    public SimuladorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getAdmins method, of class Simulador.
     */
    @Test
    public void testGetAdmins() {
        System.out.println("getAdmins");
        Simulador instance = new Simulador();
        ArrayList<Administrador> expResult = null;
        ArrayList<Administrador> result = instance.getAdmins();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setAdmins method, of class Simulador.
     */
    @Test
    public void testSetAdmins() {
        System.out.println("setAdmins");
        ArrayList<Administrador> admins = null;
        Simulador instance = new Simulador();
        instance.setAdmins(admins);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUsuarios method, of class Simulador.
     */
    @Test
    public void testGetUsuarios() {
        System.out.println("getUsuarios");
        Simulador instance = new Simulador();
        ArrayList<Usuario> expResult = null;
        ArrayList<Usuario> result = instance.getUsuarios();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setUsuarios method, of class Simulador.
     */
    @Test
    public void testSetUsuarios() {
        System.out.println("setUsuarios");
        ArrayList<Usuario> usuarios = null;
        Simulador instance = new Simulador();
        instance.setUsuarios(usuarios);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
