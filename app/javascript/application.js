// Configure import map in config/importmap.rb.
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";

// Initialize Stimulus
import { Application } from "@hotwired/stimulus";
import StarRatingController from "./controllers/star_rating_controller"; // Import your star-rating controller

const application = Application.start();
application.register("star-rating", StarRatingController);

application.debug = false;  // Toggle Stimulus debugging
window.Stimulus = application;
