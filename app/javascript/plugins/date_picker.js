import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

const datePicker = () => {
  const programForm = document.querySelector('#program-form-div');

   if (programForm) {
      const startDate   = document.getElementById("range_start");
      const today       = new Date()
      const rangeEndDiv = document.querySelector('#range-end-div')

      // fpStart est l'instance du range_start
      const fpStart = flatpickr("#range_start", {
        altInput: true,
        minDate: today.fp_incr(1), // user can't pick the before tomorow
      });

    fpStart.config.onChange.push(function(selectedDates) {

      rangeEndDiv.classList.remove('hidden')
      flatpickr("#range_end", {
        altInput: true,
        minDate: selectedDates[0].fp_incr(15),
        maxDate: new Date().fp_incr(180)
      })
    })
  }
}

export { datePicker }
