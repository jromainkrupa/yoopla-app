const buttonTextToggler = () => {
  const radioButtonSmoker = document.querySelector('#user_user_status_smoker_setup')
  const radioButtonMentor = document.querySelector('#user_user_status_mentor')
  const validationButton  = document.querySelector("input[name='commit']");

  if (radioButtonSmoker && radioButtonMentor && validationButton) {

    radioButtonSmoker.addEventListener("click",(event)=> {
      validationButton.setAttribute("value","Personnaliser son programme")
      validationButton.classList.remove('bg-gray-300', 'px-24')
      validationButton.classList.add('bg-green-300','px-12')
    })

    radioButtonMentor.addEventListener("click",(event)=> {
      validationButton.setAttribute("value","Inviter un ami")
      validationButton.classList.remove('bg-gray-300', 'px-24')
      validationButton.classList.add('bg-green-300','px-16')
    })
  }
}

export { buttonTextToggler }
