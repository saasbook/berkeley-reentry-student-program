class Checkin extends Application {

    constructor(...args) {
        super(...args);
    }

    // get the 20 checkin records start from index 20*n (sorted by time)
    get_20_checkin_records = function(n) {
    var from_index = n >= 0 ? 20 * n : 0;
    Checkin.all.order({time: "desc"})[from_index, 20] || []
  };
  

    // get the total number of checkin records
    get_total_checkin_records = function() {
    Checkin.all.size || 0
    }

}