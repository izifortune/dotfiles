return {
  "diepm/vim-rest-console",
  config = function()
    vim.g.vrc_response_default_content_type = "application/json"
    vim.g.vrc_output_buffer_name = "_output.json"
    vim.g.vrc_auto_format_response_patterns = {
      xml = "tidy -xml -i -",
      json = "jq",
      html = "tidy -i -q --tidy-mark no --show-body-only auto --show-errors 0 --show-warnings 0 -",
    }
  end,
}
