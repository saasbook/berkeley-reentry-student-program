class CheckinController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    new() {
        flash.clear;
        this._reasons = Checkin.reasons
      };
      
    create() {
        flash.clear;
        this._user = Student.find_by_id(session.current_user_id);
        this._checkin = new Checkin;
      
        this._checkin.update({
          time: Time.current,
          student_id: this._user.id,
          reason: params.checkin.reason
        });
      
        if (this._checkin.save) {
          redirect_to(
            root_path,
            {flash: {success: "Success! You've been checked in!"}}
          )
        } else {
          redirect_to(
            root_path,
            {flash: {error: "Something went wrong, please try again"}}
          )
        }
      };
      
    private;
      
    require_login() {
        if (!session.key("current_user_id") || !Student.find_by_id(session.current_user_id)) {
          redirect_to(root_path, {flash: {error: "Please log-in first!"}})
        }
      }
}