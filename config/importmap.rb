# config/importmap.rb

# Pin npm packages by running ./bin/importmap

# Standard Rails and Hotwire Pins
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# Custom Application Pins
pin "task_counter", to: "task_counter.js"

