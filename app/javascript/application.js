import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"

import EmojiController from "./controllers/emoji_controller"

window.Stimulus = Application.start()
Stimulus.register("emoji", EmojiController)
