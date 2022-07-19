class UsersController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    index() {}

    update() {
        flash.clear;
        this._user = User.find_by({id: session.current_user_id});
        var sid = params.user.sid;
        var email = params.user.email;
      
        if (sid.blank || (sid.length != 10)) {
          redirect_to(
            login_confirm_path,
            {flash: {error: "Invalid Student ID Number."}}
          );
      
          return
        };
      
        if (email.blank || !email.match(/.+(@berkeley.edu)/)) {
          redirect_to(
            login_confirm_path,
            {flash: {error: "Please use your berkeley email to log-in."}}
          );
      
          return
        };
      
        if (this._user.update(user_params)) {
          redirect_to(user_profile_new_path)
        } else {
          redirect_to(
            login_confirm_path,
            {flash: {error: "Something went wrong, please try again."}}
          )
        }
      };
      
    profile_new() {
        flash.clear;
        this._user = Student.find_by_id(session.current_user_id)
      };
      
    profile_update() {
        var skipped = params.key("skip");
        var edited = params.key("submit_edit");
      
        if (!skipped) {
          this._user = Student.find_by_id(session.current_user_id);
          this._user.update(profile_params)
        };
      
        if (edited) {
          redirect_to(
            root_path,
            {flash: {success: "Success! Your profile has been updated."}}
          )
        } else {
          redirect_to(
            root_path,
            {flash: {success: "Success! You've been logged-in!"}}
          )
        }
      };
      
    profile_edit() {
        flash.clear;
        this._user = Student.find_by_id(session.current_user_id)
      };
      
    private;
      
    require_login() {
        if (!session.key("current_user_id") || !Student.find_by_id(session.current_user_id).present) {
          redirect_to(
            root_path,
            {flash: {error: "Only students have access to profiles."}}
          )
        }
      };
      
    profile_params() {
        params.require("profile").permit(
          "major",
          "grad_year",
          "identities",
          "pronouns"
        )
      };
      
    user_params() {
        params.require("user").permit(
          "first_name",
          "last_name",
          "email",
          "sid"
        )
      }
}