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
public class InvestimentoTest {
    
    public InvestimentoTest() {
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
     * Test of getNome method, of class Investimento.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        Investimento instance = null;
        String expResult = "";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Investimento.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "";
        Investimento instance = null;
        instance.setNome(nome);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getValor method, of class Investimento.
     */
    @Test
    public void testGetValor() {
        System.out.println("getValor");
        Investimento instance = null;
        double expResult = 0.0;
        double result = instance.getValor();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setValor method, of class Investimento.
     */
    @Test
    public void testSetValor() {
        System.out.println("setValor");
        double valor = 0.0;
        Investimento instance = null;
        instance.setValor(valor);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTaxa method, of class Investimento.
     */
    @Test
    public void testGetTaxa() {
        System.out.println("getTaxa");
        Investimento instance = null;
        double[] expResult = null;
        double[] result = instance.getTaxa();
//        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTaxa method, of class Investimento.
     */
    @Test
    public void testSetTaxa() {
        System.out.println("setTaxa");
        double[] taxa = null;
        Investimento instance = null;
        instance.setTaxa(taxa);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTempo method, of class Investimento.
     */
    @Test
    public void testGetTempo() {
        System.out.println("getTempo");
        Investimento instance = null;
        int expResult = 0;
        int result = instance.getTempo();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTempo method, of class Investimento.
     */
    @Test
    public void testSetTempo() {
        System.out.println("setTempo");
        int tempo = 0;
        Investimento instance = null;
        instance.setTempo(tempo);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of cadastrarTipoInvest method, of class Investimento.
     */
    @Test
    public void testCadastrarTipoInvest() {
        System.out.println("cadastrarTipoInvest");
        Investimento instance = null;
        boolean expResult = false;
        boolean result = instance.cadastrarTipoInvest();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of cadastrarTaxa method, of class Investimento.
     */
    @Test
    public void testCadastrarTaxa() {
        System.out.println("cadastrarTaxa");
        Investimento instance = null;
        boolean expResult = false;
        boolean result = instance.cadastrarTaxa();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of lucroInvestimento method, of class Investimento.
     */
    @Test
    public void testLucroInvestimento() {
        System.out.println("lucroInvestimento");
        Investimento inv = null;
        Investimento instance = null;
        double expResult = 0.0;
        double result = instance.lucroInvestimento(inv);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of excluirInvestimento method, of class Investimento.
     */
    @Test
    public void testExcluirInvestimento() {
        System.out.println("excluirInvestimento");
        Investimento instance = null;
        boolean expResult = false;
        boolean result = instance.excluirInvestimento();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of alterarInvestimento method, of class Investimento.
     */
    @Test
    public void testAlterarInvestimento() {
        System.out.println("alterarInvestimento");
        Investimento instance = null;
        boolean expResult = false;
        boolean result = instance.alterarInvestimento();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of cadastrarInvestimento method, of class Investimento.
     */
    @Test
    public void testCadastrarInvestimento() {
        System.out.println("cadastrarInvestimento");
        Investimento instance = null;
        boolean expResult = false;
        boolean result = instance.cadastrarInvestimento();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
