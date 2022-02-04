// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "bootstrap";
import Rails from '@rails/ujs';
import "jquery-ui";
import "./html_sortable";
import "cocoon";
import { Turbo } from "@hotwired/turbo-rails";
import "controllers";
import "./gritterlocal";
import "channels"

Turbo.session.drive = true;
Rails.start();







