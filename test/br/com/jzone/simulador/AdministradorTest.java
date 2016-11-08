/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jzone.simulador;

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
public class AdministradorTest {
    
    public AdministradorTest() {
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
     * Test of cadastrarUsuario method, of class Administrador.
     */
    @Test
    public void testCadastrarUsuario() {
        System.out.println("cadastrarUsuario");
        String nome = "";
        String matricula = "";
        String user = "";
        String pass = "";
        String cpf = "";
        Administrador instance = null;
        boolean expResult = false;
        boolean result = instance.cadastrarUsuario(nome, matricula, user, pass, cpf);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of cadastrarInvt method, of class Administrador.
     */
    @Test
    public void testCadastrarInvt() {
        System.out.println("cadastrarInvt");
        Administrador instance = null;
        boolean expResult = false;
        boolean result = instance.cadastrarInvt();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
