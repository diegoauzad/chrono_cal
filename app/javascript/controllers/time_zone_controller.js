import {Controller} from "@hotwired/stimulus"
import {post} from "@rails/request.js"

// Connects to data-controller="time-zone"
export default class extends Controller {
    async connect() {
        const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
        const response = await post("/set_time_zone", {
            body: {time_zone: timeZone}
        });
    }
}
