// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';
// import 'flowbite-datepicker';
import 'flowbite-datepicker-vanilla';
// import 'flowbite/dist/datepicker.turbo.js';

// Timezone detection and submission
// Detect current time zone and load the value inside a hidden form.
document.addEventListener("turbo:load", () => {
    const userTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    const currentTimezone = document.body.getAttribute('data-timezone');

    // Only update the timezone if it has changed
    if (userTimezone !== currentTimezone) {
        document.getElementById('user_timezone').value = userTimezone;
        document.getElementById('timezone_form').requestSubmit();
    }
});

window.document.addEventListener("turbo:render", (_event) => {
    window.initFlowbite();
});

// or

window.document.addEventListener("turbo:submit-end", (_event) => {
    window.setTimeout(() => {
        window.initFlowbite();
    }, 10);
});