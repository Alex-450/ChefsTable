import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Good food is a celebration for life.."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
