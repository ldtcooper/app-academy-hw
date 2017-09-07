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

  // --- your code here!



});
