return {
  {
    "izifortune/weblink.vim",
    config = function()
      vim.g.weblink_host_url = "https://stash.ryanair.com:8443"
      vim.g.weblink_host_type = "stash"
      vim.g.weblink_host_url_prefix = "/projects/"
    end,
    cmd = { "WebLink" },
  },
}
