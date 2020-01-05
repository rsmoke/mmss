document.addEventListener('DOMContentLoaded', () => {

  window.myFunction = function() {
    var checkBoxSession1 = document.getElementById("enrollment_session_registration_ids_5");
    var activitySession1 = document.getElementById("sessionActivity1");
    var courseSession1 = document.getElementById("sessionCourses1");
    if (checkBoxSession1.checked == true){
      activitySession1.style.display = "block";
      courseSession1.style.display = "block";
    } else {
      activitySession1.style.display = "none";
      courseSession1.style.display = "none";
    }

    var checkBoxSession2 = document.getElementById("enrollment_session_registration_ids_7");
    var activitySession2 = document.getElementById("sessionActivity2");
    var courseSession2 = document.getElementById("sessionCourses2");
    if (checkBoxSession2.checked == true){
      activitySession2.style.display = "block";
      courseSession2.style.display = "block";
    } else {
      activitySession2.style.display = "none";
      courseSession2.style.display = "none";
    }

    var checkBoxSession3 = document.getElementById("enrollment_session_registration_ids_8");
    var activitySession3 = document.getElementById("sessionActivity3");
    var courseSession3 = document.getElementById("sessionCourses3");
    if (checkBoxSession3.checked == true){
      activitySession3.style.display = "block";
      courseSession3.style.display = "block";
    } else {
      activitySession3.style.display = "none";
      courseSession3.style.display = "none";
    }
  }
})
