class LoginController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }

    confirm() {
        this._user = User.find_by({id: session.current_user_id});
      
        if (this._user.nil) {
          redirect_to(root_path, {flash: {error: "Please log-in first!"}})
        }
      }
}