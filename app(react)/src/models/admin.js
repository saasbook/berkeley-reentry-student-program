class Admin extends Application {

    constructor(...args) {
        super(...args);
    }
    announcement_list() {
        return Announcement.all.order({time: "desc"});
    }
    announcement_create(announcement) {
        announcement.save();
    }
    announcement_delete(announcement) {
        announcement.destroy();
    }
    announcement_edit(announcement) {
        announcement.update({
            title: announcement.title,
            content: announcement.content
        });
    }
    announcement_show(announcement) {
        return announcement;
    }
    announcement_new() {
        return new Announcement;
    }
    announcement_update(announcement) {
        announcement.update({
            title: announcement.title,
            content: announcement.content
        });
    }  
    announcement_find_by_id(id) {
        return Announcement.find_by_id(id);
    }
    announcement_find_by_title(title) {
        return Announcement.find_by_title(title);
    }
    announcement_find_by_content(content) {
        return Announcement.find_by_content(content);
    }

}