import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template"
export default class extends Controller {
  static targets = ["templateId"]

  connect() {
    this.editor_content = document.getElementById("content")
  }

  update() {
    if (isNaN(Number(this.templateIdTarget.value))) {
      this.update_editor("{\"blocks\":[]}")
      return
    }

    if (!this.templateIdTarget[0].value) {
      this.templateIdTarget[0].value = "og"
      this.templateIdTarget[0].label = "<Original Content>"
      // TODO: somehow get the saved data
    }

    if (this.templateIdTarget.value) {
      fetch(`/page_templates/${this.templateIdTarget.value}/json`)
            .then((response) => response.json())
            .then((data) => this.update_editor(data.template))
    } else {
      this.update_editor("{\"blocks\": []}")
    }
  }

  update_editor(data) {
    this.dispatch("update", { detail: { content: data } })
  }
}
