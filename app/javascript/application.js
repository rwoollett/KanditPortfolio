// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails";
import "controllers";
import "channels";

import "bootstrap";
import Rails from '@rails/ujs';
import "jquery-ui";
import "cocoon";
import "./html_sortable";
import "./gritterlocal";

Turbo.session.drive = true;
Rails.start();







