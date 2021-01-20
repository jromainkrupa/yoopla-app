const programCigarettesCalculation = (nbrOfDays) => {
  const nbCigProg      = document.getElementById("nb-cig-prog")
  const nbCigTheory    = document.getElementById("nb-cig-theory")
  const spendMoney     = document.getElementById("spend-money")
  const sparedMoney    = document.getElementById("spared-money")
  const cigarettePrice = 0.51
  const arrayOfDays    = [...Array(nbrOfDays).keys()]
  let totalTheory      = Number.parseInt(nbCigProg.dataset.avgSmoke, 10) * nbrOfDays
  let total            = 0

  arrayOfDays.forEach((day) => {
    // this is y = ax + b
    let y   = Math.round(((- Number.parseInt(nbCigProg.dataset.avgSmoke, 10) / (nbrOfDays-1)) * day)) + Number.parseInt(nbCigProg.dataset.avgSmoke, 10)
    total  += y

  })

  nbCigProg.innerText   = total
  nbCigTheory.innerText = totalTheory
  spendMoney.innerText  = Math.round(total * cigarettePrice)
  sparedMoney.innerText = Math.round(totalTheory * cigarettePrice) - Math.round(total * cigarettePrice)
}

export { programCigarettesCalculation }
