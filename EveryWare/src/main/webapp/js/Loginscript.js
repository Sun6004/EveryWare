const wrapper = document.querySelector(".wrapper");
const loginLink = document.querySelector(".login-link");
const registerLink = document.querySelector(".register-link");

const btnPopup = document.querySelector(".btnLogin-popup");
const iconClose = document.querySelector(".icon-close");

registerLink.addEventListener("click", () => {
  wrapper.classList.add("active");
});

loginLink.addEventListener("click", () => {
  wrapper.classList.remove("active");
});

/*btnPopup.addEventListener("click", () => {
  // wrapper.classList.add("active-popup");
  if (wrapper.classList.contains("active-popup")) {
    wrapper.classList.remove("active-popup");
  } else {
    wrapper.classList.add("active-popup");
  }
});

iconClose.addEventListener("click", () => {
  wrapper.classList.remove("active-popup");
});*/
const centeredDiv = document.querySelector(".centered");
const header = document.querySelector("header");
