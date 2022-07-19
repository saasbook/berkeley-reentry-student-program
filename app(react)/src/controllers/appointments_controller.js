class AppointmentController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    index() {}

    advisors() {};

    require_login() {
    if (!session.has_key("current_user_id") || !Student.find_by_id(session.current_user_id)) {
        redirect_to(login_path, {method: "get"})
    }
    }
}