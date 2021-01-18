import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const datePicker = () => {
  const programForm = document.querySelector('#program-form-div');

   if (programForm) {
    // const programs = JSON.parse(programForm.dataset.programs);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      defaultDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      showMonths: 1,
      onOpen: [
        function(selectedDates, dateStr, instance){
            console.log("hello")
        }]
    })
  }
}
export { datePicker }
