require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// custom functions
import { buttonTextToggler } from "../components/button_text_toggler.js"
import { cigaretteIncrementer } from "../components/cigarette_incrementer.js"
import { cigaretteCounter } from "../components/cigarette_counter.js"
import { daysCounter }      from "../components/days_counter.js"

// plugins import from ../plugins/
import { datePicker }        from "../plugins/date_picker.js"

import "controllers"


import "stylesheets/application"

document.addEventListener('turbolinks:load', () => {
  buttonTextToggler();
  cigaretteIncrementer();
  datePicker();
  daysCounter();
  cigaretteCounter();
});

