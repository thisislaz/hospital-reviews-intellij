
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
      screens: {
          'sm': '640px',
          // => @media (min-width: 640px) { ... }

          'md': '768px',
          // => @media (min-width: 768px) { ... }

          'lg': '1024px',
          // => @media (min-width: 1024px) { ... }

          'xl': '1280px',
          // => @media (min-width: 1280px) { ... }

          '2xl': '1536px',
          // => @media (min-width: 1536px) { ... }
          },
      extend: {
          screens: {
              '3xl': '1600px',
          }
      },

  },
  plugins: [
      require("daisyui"),
      require('@tailwindcss/forms'),
      require('preline/plugin'),
  ],
}