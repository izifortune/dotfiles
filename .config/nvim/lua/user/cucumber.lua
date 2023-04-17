local Pkg = require "mason-core.package"
local github = require "mason-core.managers.github"
local path = require "mason-core.path"
local Optional = require "mason-core.optional"

return Pkg.new {
	name = "cucumber-latest",
	desc = [[Language Server for cucumber.]],
	homepage = "https://github.com/cucumber/language-server",
	languages = { Pkg.Lang.Cucumber },
	categories = { Pkg.Cat.LSP },
	---@async
	---@param ctx InstallContext
	install = function(ctx)
		github
				.unzip_release_file({
					repo = "cucumber/language-server",
					version = Optional.new "fix-standalone",
					asset_file = function(version) return ("cucumber_language_server-%s.vsix"):format "1.4.0" end,
				})
				.with_receipt()

		ctx:link_bin(
			"rescript-lsp",
			ctx:write_node_exec_wrapper(
				"rescript-lsp",
				path.concat {
					"extension",
					"server",
					"out",
					"server.js",
				}
			)
		)
	end,
}
