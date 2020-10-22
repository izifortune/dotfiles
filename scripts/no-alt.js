document.querySelectorAll("img").forEach((el) => {
  if (!el.getAttribute("alt")) {
    console.log("no attri", el);
    el.style = "border: 5px solid red";
  }
});
