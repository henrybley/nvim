local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep

local function get_namespace()
	local path = vim.fn.expand("%:p") or ""
	local parts = vim.split(path, "/")
	local app_index = nil

	-- find "src" or "App" in the path to base the namespace from
	for idx, part in ipairs(parts) do
		if part == "src" or part == "App" then
			app_index = idx
			break
		end
	end

	if not app_index then
		return "App"
	end

	local namespace_parts = {}
	for i = app_index + 1, #parts - 1 do
		table.insert(namespace_parts, parts[i])
	end

	return "App\\" .. table.concat(namespace_parts, "\\")
end

-- Get current filename without extension
local function get_filename()
	return vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
end

ls.add_snippets("php", {
	s("nsclass", {
		t("<?php"),
		t({ "", "" }),
		t("namespace "),
		f(function()
			return get_namespace()
		end),
		t(";"),
		t({ "", "" }),
		t({ "", "class " }),
		f(function()
			return get_filename()
		end),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("for", {
		t("for ($"),
		i(1, "i"),
		t(" = "),
		i(2, "0"),
		t("; $"),
		rep(1),
		t(" < "),
		i(3, "count"),
		t("; $"),
		rep(1),
		t("++),"),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("foreach", {
		t("foreach ($"),
		i(1, "items"),
		t(" as "),
		i(2, "$item"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("foreach-key", {
		t("foreach ($"),
		i(1, "items"),
		t(" as "),
		i(2, "$key"),
		t(" => "),
		i(3, "$value"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("switch", {
		t("switch ("),
		i(1, "$variable"),
		t({ ") {", "\tcase " }),
		i(2, "'value'"),
		t({ ":", "\t\t" }),
		i(3, "// code..."),
		t({ "", "\t\tbreak;", "", "\tdefault:", "\t\t" }),
		i(4, "// default code..."),
		t({ "", "\t\tbreak;", "}" }),
	}),
	s("route", {
		t({ "#[Route('" }),
		i(1, "/path"),
		t({ "', name: '" }),
		i(2, "app_route"),
		t({ "', methods: ['" }),
		i(3, "GET"),
		t({ "'])]" }),
		t({ "", "public function " }),
		i(4, "index"),
		t({ "(" }),
		i(5),
		t({ ")", ": Response", "{" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "\treturn new Response();" }),
		t({ "", "}" }),
	}),
	s("constructor", {
		t("public function __construct("),
		i(1, "private Type $dependency"),
		t(")"),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
})
