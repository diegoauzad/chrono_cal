import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["start", "end"]

    updateEndDatetime() {

        const startTime = this.startTarget.value;
        const endTime = this.endTarget.value;

        if (startTime && endTime && startTime >= endTime) {
            const adjustedEndTime = new Date(startTime);
            adjustedEndTime.setMinutes(adjustedEndTime.getMinutes() + 30); // Adjust by 30 minutes or any other logic
            this.endTarget.value = adjustedEndTime.toISOString().slice(0, 16); // Update the end time
        }
    }
}
