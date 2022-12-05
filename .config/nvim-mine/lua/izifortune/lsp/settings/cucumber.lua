return {
  filetypes = { "cucumber", "feature" },
  settings = {
    features = {
      "**/*.feature"
    },
    glue = {
      "**/*.steps-definition.ts",
      "**/*.steps.ts",
      "**/*.steps.js"
    }
  }
}
