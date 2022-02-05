# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.1/lib/assets/compiled/rails-ujs.js"
pin "jquery-ui", to: 'jquery-ui.js'
pin "gritterlocal", to: "gritterlocal.js"
pin "html_sortable", to: "html_sortable.js"
pin "cocoon", to: 'cocoon.js'
pin "popper", to: 'popper.js'
pin "bootstrap", to: 'bootstrap.min.js'

pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
