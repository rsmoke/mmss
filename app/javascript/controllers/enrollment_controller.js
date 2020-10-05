import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = [ "session", "checkbox", "courses" ]

  connect() {
    var checked = this.checkboxTargets.filter(checkbox => checkbox.checked)
    checked.forEach((el) => {
      if (el.dataset.index > 0) {
        this.showSession(el.dataset.index)
        this.showCourses(el.dataset.index)
      }
    })

  }
  
  display_toggle_session() {
    var item_index = event.currentTarget.dataset.index
    // alert("current_target: " + item_index);
    
    if (item_index > 0) {
      this.uncheckAll(item_index)
      this.showSession(item_index)
      this.showCourses(item_index)
    }
  }

  showSession(index){
    this.index = index
    this.sessionTargets[index -1].classList.toggle("session--hide")
  }

  showCourses(index){
    this.index = index
    this.coursesTargets[index -1].classList.toggle("session--hide")
  }

  uncheckAll(divid) {
    $('#sessionActivity' + divid + ' :checkbox:enabled').prop('checked', false);
    $('#sessionCourses' + divid + ' :checkbox:enabled').prop('checked', false);
  }

}

