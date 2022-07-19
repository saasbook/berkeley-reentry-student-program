class AdminController extends ApplicationController {
    constructor(...args) {
        super(...args);
    }
    index() {
        this.render('admin/index');
    }

    view_checkin_records() {
    if ((!params.key("page")) || (params.page < 1)) {
        redirect_to(view_checkin_records_path({page: 1}));

        // return is needed here, otherwise the app will continue execute
        // the following instructions after redirect
        return
    };

    var n = params.page.to_i - 1;
    this._checkin_records = Checkin.get_20_checkin_records(n);
    this._has_next_page = this._checkin_records.size == 20
    };

    private;

    check_permission() {
    var admin = Admin.find_by_id(session.current_user_id);

    if (!admin || !admin.is_admin) {
        redirect_to(
        root_path,
        {flash: {error: "You don't have the permission to do that!"}}
        )
    }
    }
}