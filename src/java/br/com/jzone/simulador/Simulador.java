package br.com.jzone.simulador;

import java.util.ArrayList;

/**
 * @author Carlos Henrique
 */
public class Simulador {

    private ArrayList<Administrador> admins;
    private ArrayList<Usuario> usuarios;

    public Simulador() {

        admins = new ArrayList<>();
        usuarios = new ArrayList<>();

    }

    public ArrayList<Administrador> getAdmins() {
        return admins;
    }

    public void setAdmins(ArrayList<Administrador> admins) {
        this.admins = admins;
    }

    public ArrayList<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(ArrayList<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

}
