return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local jdtls = require("jdtls")
    local home = vim.fn.expand("~")

    local root_dir = require("jdtls.setup").find_root({
      "gradlew",
      "settings.gradle",
      "settings.gradle.kts",
      ".git"
    })

    if not root_dir then return end

    local workspace_dir = home .. "/.local/share/jdtls-workspaces/" ..
      vim.fn.fnamemodify(root_dir, ":p:h:t")

    local jdtls_base = vim.fn.glob("/nix/store/*-jdt-language-server-*/share/java/jdtls")
    local launcher_path = vim.fn.glob(jdtls_base .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local config_dir = home .. "/.cache/jdtls/config_linux"

    if vim.fn.isdirectory(config_dir) == 0 then
      vim.fn.mkdir(config_dir, "p")
      vim.fn.system("cp -r " .. jdtls_base .. "/config_linux/* " .. config_dir)
    end

    jdtls.start_or_attach({
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "-jar", launcher_path,
        "-configuration", config_dir,
        "-data", workspace_dir,
      },
      root_dir = root_dir,
    })
  end
}

