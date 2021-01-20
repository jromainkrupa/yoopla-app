import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

const datePicker = () => {
  const startDate          = document.getElementById("range_start");

  let today = new Date()
  const programForm = document.querySelector('#program-form-div');

   if (programForm) {
    // const programs = JSON.parse(programForm.dataset.programs);
    flatpickr("#range_start", {
      altInput: true,
      minDate: today.fp_incr(1)
    });

    flatpickr("#range_end", {
      altInput: true,
      minDate: new Date().fp_incr(15),
      maxDate: new Date().fp_incr(180)
    })
  }
}

export { datePicker }
