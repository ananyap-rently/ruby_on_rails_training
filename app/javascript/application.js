// app/javascript/application.js

import "@hotwired/turbo-rails"
import "controllers"

import { initializeCounter } from "task_counter"

document.addEventListener("turbo:load", initializeCounter);
