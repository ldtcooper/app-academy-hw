document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const placeForm = document.getElementById('place-form');
  const addPlace = function() {
    placeForm.addEventListener("submit", e => {
      e.preventDefault();
      const newPlace = document.getElementsByClassName('favorite-input')[0];
      const placeName = newPlace.value;
      newPlace.value = "";
      const placesList = document.getElementById('sf-places');
      const li = document.createElement('li');
      li.textContent = placeName;
      placesList.append(li);
    });

  };
  addPlace();

  // adding new photos

  const showFormButton = document.getElementsByClassName("photo-show-button")[0];
  const photoForm = document.getElementsByClassName("photo-form-container")[0];
  const photoList = document.getElementsByClassName("dog-photos")[0];

  const togglePhotoForm = function() {
    showFormButton.addEventListener("click", e => {
      e.preventDefault();
      if (photoForm.classList.contains("hidden")) {
        photoForm.classList.remove("hidden");
      } else {
        photoForm.classList.add("hidden");
      }
    });
  };

  const addPhoto = function() {
    photoForm.addEventListener("submit", e => {
      e.preventDefault();
      const newPhoto = document.getElementsByClassName("photo-url-input")[0];
      const imgURL = newPhoto.value;
      newPhoto.value = "";
      const li = document.createElement("li");
      const img = document.createElement("img");
      img.src = imgURL;
      li.append(img);
      photoList.append(li);
    });
  };

  togglePhotoForm();
  addPhoto();

});
