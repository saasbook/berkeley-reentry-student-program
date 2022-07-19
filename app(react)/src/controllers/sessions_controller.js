class SessionsController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    index() {
        this.render('sessions/index');
    }
    login() {
        this.render('sessions/login');
    }
    logout() {
        this.render('sessions/logout');
    }
    private;
    google_auth() {
        // Get access tokens from the google server
        var access_token = request.env["omniauth.auth"];
        var existing_user = User.where({email: access_token.info.email}).first;
      
        if (existing_user.present) {
          session.current_user_id = existing_user.id;
      
          redirect_to(
            root_path,
            {flash: {success: "Success! You've been logged-in!"}}
          );
      
          return
        };
      
        var user = User.from_omniauth(access_token);
      
        // Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token;
      
        // Refresh_token to request new access_token
        // Note: Refresh_token is only sent once during the first request
        var refresh_token = access_token.credentials.refresh_token;
        if (refresh_token.present) user.google_refresh_token = refresh_token;
      
        // set appropriate permissions
        user = set_user_permission(user, access_token.info.email);
      
        if (!user) {
          redirect_to(
            root_path,
            {flash: {error: "Something went wrong, please try again later."}}
          )
        } else if (user.save) {
          user_first_login(user)
        } else {
          redirect_to(
            root_path,
            {flash: {error: "Something went wrong, please try again"}}
          )
        }
      };
      
      google_auth_logout() {
        session.delete("current_user_id");
      
        redirect_to(
          root_path,
          {flash: {success: "You've been successfully logged-out!"}}
        )
      };
      
      private;
      
      user_first_login(user) {
        session.current_user_id = user.id;
      
        if (user.is_student) {
          redirect_to(login_confirm_path)
        } else if (user.is_admin) {
          redirect_to(
            root_path,
            {flash: {success: "Success! You've been logged-in!"}}
          )
        } else {
          // user must be staff
          redirect_to(
            root_path,
            {flash: {success: "Success! You've been logged-in!"}}
          )
        }
      };
      
      set_user_permission(user, email) {
        // Get the official admins
        var admins = ENV.ADMINS.split(",");
        var staff = ENV.STAFF.split(",");
        if (admins.blank || staff.blank) return null;
        user.is_admin = admins.include(email);
        user.is_staff = staff.include(email);
        user.is_student = !user.is_admin && !user.is_staff;
        user
      }
}