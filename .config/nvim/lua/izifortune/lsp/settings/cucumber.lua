return {
  filetypes = { "cucumber", "feature" },
  settings = {
    cucumber = {
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
}
