
/** @type {import('tailwindcss').Config} */


module.exports = {
  content: [
      "./src/main/webapp/WEB-INF/views/**/*.{jsp,js}",
      "./src/main/webapp/js/**/*.js",
      "./node_modules/preline/dist/*.js",
  ],

  daisyui: {
    themes: [""],
  },
  theme: {
    extend: {},
  },
  plugins: [
      require("daisyui"),
      require('@tailwindcss/forms'),
      require('preline/plugin'),
      require("tailgrids/plugin")
  ],
}