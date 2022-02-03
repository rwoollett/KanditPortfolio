// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery";
import "bootstrap";
import Rails from '@rails/ujs';
import "jquery-ui";
import "./html_sortable";
import "cocoon";
import "@hotwired/turbo-rails";
import "controllers";
import "./gritterlocal";
import "channels"

Rails.start();
