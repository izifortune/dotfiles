return {
  filetypes = { "cucumber" },
  settings = {
    cucumber = {
      features = {
        "**/*.feature"
      },
      glue = {
        "**/*.steps.ts",
        "**/*.steps.js"
      }
    }
  }
}

