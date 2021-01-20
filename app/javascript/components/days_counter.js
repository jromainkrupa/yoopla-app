import { setDifficultyColor }           from './set_difficulty_color.js'
import { programCigarettesCalculation } from './program_cigarettes_calculation.js'

const daysCounter = () => {
  const startDate          = document.getElementById("range_start");
  const endDate            = document.getElementById("range_end");
  const totalDays          = document.getElementById("total-days")
  const totalPriceElement  = document.getElementById("total-smokes")
  const startDateReminder  = document.getElementById("start_date")
  const endDateReminder    = document.getElementById("end_date")

  if (startDate && endDate && totalDays) {
    // calcul la diff entre la date start et la date end
    const diffCalc = ()  => {
      let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
      let nbrOfDays = (dateDiffInMilliseconds / 86400000) + 1;

      // met à jour le DOM avec les élements
      if(startDate.value && endDate.value) {
        totalDays.innerText = nbrOfDays
        startDateReminder.innerText = new Date(startDate.value).toLocaleDateString('fr-FR')
        endDateReminder.innerText = new Date(endDate.value).toLocaleDateString('fr-FR')
        setDifficultyColor(nbrOfDays)
        programCigarettesCalculation(nbrOfDays)
      }
    };

    [startDate, endDate].forEach(date => {
      date.addEventListener("change", (event) => {
        diffCalc();
      });
    });
  }
}

export { daysCounter}
