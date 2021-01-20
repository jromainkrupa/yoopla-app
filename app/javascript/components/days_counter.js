import { setDifficultyColor } from './set_difficulty_color.js'

const daysCounter = () => {
  const startDate          = document.getElementById("range_start");
  const endDate            = document.getElementById("range_end");
  const totalDays          = document.getElementById("total-days")
  const totalPriceElement  = document.getElementById("total-smokes")
  const startDateReminder  = document.getElementById("start_date")
  const endDateReminder    = document.getElementById("end_date")
  const nbCigProg          = document.getElementById("nb-cig-prog")
  const nbCigTheory        = document.getElementById("nb-cig-theory")

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
        cigarettesCalculation(nbrOfDays)
      }
    };



    const cigarettesCalculation = (nbrOfDays) => {

      console.log(nbCigProg.dataset.avgSmoke)
      const arrayOfDays = [...Array(nbrOfDays).keys()]
      let total = 0
      arrayOfDays.forEach((day) => {
        // this is y = ax + b
        let y = Math.round(((- Number.parseInt(nbCigProg.dataset.avgSmoke, 10) / (nbrOfDays-1)) * day)) + Number.parseInt(nbCigProg.dataset.avgSmoke, 10)
        total += y

      })
      nbCigProg.innerText = total
      nbCigTheory.innerText = Number.parseInt(nbCigProg.dataset.avgSmoke, 10) * nbrOfDays
    }

    [startDate, endDate].forEach(date => {
      date.addEventListener("change", (event) => {
        diffCalc();
      });
    });
  }
}

export { daysCounter}
