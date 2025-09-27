// eslint.config.js
const { defineConfig } = require("eslint/config");
const globals = require("globals");
const js = require("@eslint/js");

module.exports = defineConfig([
  js.configs.recommended, // base rules của ESLint
  {
    languageOptions: {
      ecmaVersion: 2018,
      parserOptions: {},
      globals: {
        ...globals.node,
      },
    },
    rules: {
      "no-restricted-globals": ["error", "name", "length"],
      "prefer-arrow-callback": "error",
      quotes: ["error", "double", { allowTemplateLiterals: true }],
      // (tuỳ chọn) thêm vài rule “google-like”
      semi: ["error", "always"],
      "no-var": "error",
      "prefer-const": "error",
      eqeqeq: ["error", "always"],
    },
  },
  {
    files: ["**/*.spec.*"],
    languageOptions: {
      globals: {
        ...globals.mocha,
      },
    },
    rules: {},
  },
]);
