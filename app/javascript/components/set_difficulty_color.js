const setDifficultyColor = (nbrOfDays) => {
  const difficultyGradient = document.getElementById("gradient-difficulty")
  const difficultyText     = document.getElementById("text_difficulty")
  const validationButton   = document.querySelector("input[name='commit']")

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

export { setDifficultyColor }
