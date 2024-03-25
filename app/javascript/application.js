// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';
// import 'flowbite-datepicker';
import 'flowbite-datepicker-vanilla';
// import 'flowbite/dist/datepicker.turbo.js';

window.document.addEventListener("turbo:render", (_event) => {
    window.initFlowbite();
});

// or

window.document.addEventListener("turbo:submit-end", (_event) => {
    window.setTimeout(() => {
        window.initFlowbite();
    }, 10);
});import "@rails/request.js"
