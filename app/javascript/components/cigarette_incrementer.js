const cigaretteIncrementer = () => {

const updateCounter = (counter, count) => {
  counter.dataset.count = count;
  counter.value = count;
};

const updateForm = (event) => {
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  const counter = document.getElementById('counter');
  const count = Number.parseInt(counter.dataset.count, 10);
  console.log(offset)
  console.log(count)

  if (count >= 1) { {}
    updateCounter(counter, count);

  } else {
    event.preventDefault();
  }
};

const updateFormOnButtonClick = (button) => {
  button.addEventListener('click', updateForm);
};

const buttons = document.querySelectorAll('.incrementer');
buttons.forEach(updateFormOnButtonClick);
}

export { cigaretteIncrementer }
