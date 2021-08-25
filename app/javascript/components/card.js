const toggleIndexCards = () => {
    document.querySelectorAll(".img-index").forEach((img) => {
    img.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("red");
    });
  });
}
