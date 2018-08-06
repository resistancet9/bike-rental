// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function changeQuantity(event, initial) {
  let id = event ? event.target.value : initial;
  fetch(`/bikes/${id}.json`)
    .then(v => v.json())
    .then(d => {
      document.querySelector("#quantity").value = 1;
      document.querySelector("#quantity").max = d.qty;
      document.querySelector("#available").innerText = d.qty;
    });
}

function changeEndDate(event, initial) {
  document.querySelector("#end-date").min = moment(
    document.querySelector("#start-date").value
  )
    .add(1, "days")
    .format("YYYY-MM-DD");
  document.querySelector("#end-date").value = moment(
    document.querySelector("#start-date").value
  )
    .add(1, "days")
    .format("YYYY-MM-DD");
}

function changeStartDate() {
  document.querySelector("#start-date").min = moment().format("YYYY-MM-DD");
  document.querySelector("#start-date").value = moment().format("YYYY-MM-DD");
}

function noOfDays() {
  document.querySelector("#no-of-days").innerText = Math.abs(
    moment(document.querySelector("#end-date").value).diff(
      document.querySelector("#start-date").value,
      "days"
    )
  );
}
document.addEventListener("DOMContentLoaded", function(event) {
  changeQuantity(null, 1);
  changeStartDate();
  changeEndDate();
});
