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
    .format("YYYY-MM-DDTHH:mm");
  document.querySelector("#end-date").value = moment(
    document.querySelector("#start-date").value
  )
    .add(1, "days")
    .format("YYYY-MM-DDTHH:mm");
}

function changeStartDate() {
  document.querySelector("#start-date").min = moment().format(
    "YYYY-MM-DD HH:mm"
  );
  document.querySelector("#start-date").value = moment().format(
    "YYYY-MM-DDTHH:mm"
  );
}

function noOfDays() {
  let difference = Math.abs(
    moment(document.querySelector("#end-date").value).diff(
      document.querySelector("#start-date").value,
      "days"
    )
  );

  document.querySelector("#no-of-days").innerText = difference;
  document.querySelector("#no_of_days").value = difference;

  checkNoOfDays();
  checkNoofHours();
}

function checkNoOfDays() {
  let start_date = document.querySelector("#start-date").value;
  let num_of_days = document.querySelector("#no-of-days").innerHTML;
  let weekdays = document.querySelector("#weekdays");
  let weekenddays = document.querySelector("#weekenddays");

  let day = 0;
  let week_days = 0;
  let week_end_days = 0;

  do {
    day = moment(start_date).day();
    if (day === 0 || day === 6) week_end_days++;
    else week_days++;
    start_date = moment(start_date)
      .add(1, "days")
      .format("YYYY-MM-DDTHH:mm");
  } while (num_of_days-- != 0);

  weekdays.value = week_days;
  weekenddays.value = week_end_days;
}

function checkNoofHours() {
  let difference_h = Math.abs(
    moment(document.querySelector("#end-date").value).diff(
      document.querySelector("#start-date").value,
      "hours"
    )
  );

  document.querySelector("#no_of_hours").value = difference_h;
}
