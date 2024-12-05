-- This filetype specific handler lives in ~/.config/nvim/after/ftplugin/apexcode.lua
-- kickstart.nvim provides out of the box mason/lspconfig and out of the box treesitter.

-- Next I installed apex-language-server by running the :Mason command and following the "gui"

-- Then I installed the Salesforce Extension pack in VSCode - doing so added apex-jorje-lsp.jar to my ~/.vscode.
-- You _need_ this file for apex_jar_path below

-- With these installed, the following will enable LSP features
require('lspconfig').apex_ls.setup {
  apex_jar_path = '/home/matt/.config/nvim/apex/apex-jorje-lsp.jar',
  apex_enable_semantic_errors = true, -- Whether to allow Apex Language Server to surface semantic errors
  apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
}

-- and the following will fix a filetype misalignment and allow treesitter to format for apex
-- when the apexcode filetype is loaded
vim.treesitter.language.register('apex', { 'apex', 'apexcode' })
