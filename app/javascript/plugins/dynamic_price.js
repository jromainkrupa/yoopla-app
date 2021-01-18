const dynamicPrice = () => {
  const startDate          = document.getElementById("range_start");
  const endDate            = document.getElementById("range_end");
  const totalDays          = document.getElementById("total-days")
  const totalPriceElement  = document.getElementById("total-smokes")
  const difficultyGradient = document.getElementById("gradient-difficulty")
  const startDateReminder  = document.getElementById("start_date")
  const endDateReminder    = document.getElementById("end_date")
  const difficultyText     = document.getElementById("text_difficulty")
  const validationButton   = document.querySelector("input[name='commit']")

  if (startDate && endDate && totalDays) {
    // calcul la diff entre la date start et la date end
    const diffCalc = ()  => {
      let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
      let nbrOfDays = dateDiffInMilliseconds / 86400000;

      // met à jour le DOM avec les élements
      if(startDate.value && endDate.value) {
        totalDays.innerText = nbrOfDays
        startDateReminder.innerText = new Date(startDate.value).toLocaleDateString('fr-FR')
        endDateReminder.innerText = new Date(endDate.value).toLocaleDateString('fr-FR')
        setDifficultyColor(nbrOfDays)
      }
    };

    const setDifficultyColor = (nbrOfDays) => {
        difficultyGradient.classList.remove('bg-gradient-to-r','from-red-500','via-blue-500','to-green-500')
        if (nbrOfDays < 30) {
          difficultyGradient.classList.add('bg-gradient-to-r','from-red-600','to-red-300')
          difficultyText.innerText = "💪"
        } else if (nbrOfDays >= 30 && nbrOfDays <= 90) {
          difficultyGradient.classList.add('bg-gradient-to-r','from-green-600','to-green-300')
          difficultyText.innerText = "✌️"
        } else {
          difficultyGradient.classList.add('bg-gradient-to-r','from-blue-600','to-blue-300')
          difficultyText.innerText = "🤙"
        }
        validationButton.setAttribute("value","étape 3")
        validationButton.classList.remove('bg-gray-300', 'px-24')
        validationButton.classList.add('bg-green-300','px-16')
      }


    [startDate, endDate].forEach(date => {
      date.addEventListener("change", (event) => {
        diffCalc();
      });
    });
  }
}

export { dynamicPrice}
