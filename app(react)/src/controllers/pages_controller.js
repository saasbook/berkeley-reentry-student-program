class PagesController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    index() {
        this.render('pages/index');
    }
    about() {
        this.render('pages/about');
    }
    contact() {
        this.render('pages/contact');
    }
    privacy() {
        this.render('pages/privacy');
    }
    terms() {
        this.render('pages/terms');
    }
    faq() {
        this.render('pages/faq');
    }
    private;

    authenticate() {
    this._user_type = [];
    var user = User.find_by_id(session.current_user_id);

    if (user) {
        this._name = user.name;
        if (user.is_admin) this._user_type.push("Admin");
        if (user.is_staff) this._user_type.push("Staff");
        if (user.is_student) this._user_type.push("Student")
    };

    this._logged_out = !user
    }
}