local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Get current filename without extension
local function filename()
	return vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
end

-- Get Java package name from file path
local function package_name()
	local file = vim.fn.expand("%:p")
	local src_index = string.find(file, "/src/")
	if not src_index then
		return ""
	end
	-- extract path between /src/ and filename
	local package_path = string.sub(file, src_index + 5, -(#filename() + 6))
	local pkg = package_path:gsub("/", ".")
	return pkg
end

ls.add_snippets("java", {
	s("class", {
		f(function()
			local pkg = package_name()
			if pkg ~= "" then
				return "package " .. pkg .. ";\n\n"
			end
			return ""
		end, {}),
		t("public class "),
		f(filename, {}),
		t({ " {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
})
