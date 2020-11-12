const stars = document.querySelector(".ratings").children;
const ratingValue = document.getElementById("rating_value");
const ratingValueDisplay = document.getElementById("rating_value_display")

let index;

for(let i = 0; i < stars.length; i++){
     stars[i].addEventListner("mouseover",function(){
          for(let j=0; j < stars.length; j++){
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
          }
          for(let j=0; j <= i; j++){
          stars[j].classList.remove("fa-star-o");
          stars[j].classList.add("fa-star");
          }
     })
     stars[i].addEventListner("click", function(){
          ratingValue.value = i + 1;
          ratingValuee.textContent = ratingValue.value;
          index = i;
     })
     stars[i].addEventListner("mouseout",function(){
          for(let j=0; j < stars.length; j++){
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
          }
          for(let j=0; j <= index; j++){
          stars[j].classList.remove("fa-star-o");
          stars[j].classList.add("fa-star");
          }
     })
}