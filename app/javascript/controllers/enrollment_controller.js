import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = [ "session", "checkbox", "courses" ]

  connect() {
    var checked = this.checkboxTargets.filter(checkbox => checkbox.checked)
    checked.forEach((el) => {
      console.dir(el.dataset)
      this.showSession(el.dataset.index)
      this.showCourses(el.dataset.index)
    })

  }
  
  display_toggle_session() {
    var item_index = event.currentTarget.dataset.index
    this.showSession(item_index)
    this.showCourses(item_index)
  }

  showSession(index){
    console.log("Session: " + index)
    this.index = index
    this.sessionTargets[index].classList.toggle("session--hide")
  }

  showCourses(index){
    console.log("Course: " + index)
    this.index = index
    this.coursesTargets[index].classList.toggle("session--hide")
  }

}