return {
  -- We use an empty table or a fake dependency name so lazy.nvim
  -- evaluates this file without forcing a plugin download.
  dir = vim.fn.stdpath 'config',
  name = 'native_rust_analyzer_config',
  config = function()
    -- Apply settings natively to Neovim 0.11+'s LSP configuration
    vim.lsp.config.rust_analyzer = {
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = 'clippy',
          },
        },
      },
    }

    -- Force Neovim to register and autostart it on rust filetypes
    vim.lsp.enable 'rust_analyzer'
  end,
}
