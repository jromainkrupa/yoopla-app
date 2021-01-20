const programCigarettesCalculation = (nbrOfDays) => {
  const nbCigProg          = document.getElementById("nb-cig-prog")
  const nbCigTheory        = document.getElementById("nb-cig-theory")

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

export { programCigarettesCalculation }
