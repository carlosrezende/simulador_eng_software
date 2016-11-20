package db;

/**
 * @author Carlos Henrique
 */
public class Login {

    LoginAdm la;
    LoginUser lu;

    private String message;

    public int getLevel(String user, String password) {

        if (user.equals("") || password.equals("")) {
            message = "Os campos não devem ficar vazios.";
            return 0;
        }

        int level;
        try {

            la = new LoginAdm();
            level = la.login(user, password);

            if (level == 3) {
                return level;
            }

            lu = new LoginUser();
            level = lu.login(user, password);

            if (level == 2) {
                return level;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        message = "Login ou senha incorretos.";
        return 0;

    }

    public String getMessage() {
        return message;
    }

}
