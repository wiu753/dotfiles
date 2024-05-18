vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true

lvim.keys.normal_mode["<M-h>"] = "<Home>"
lvim.keys.normal_mode["<M-l>"] = "<End>"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp_ls", "csharp-language-server", "c_sharp", "charp-ls" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "omnisharp"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.plugins = {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon").setup()
      harpoon:setup()

      vim.keymap.set("n", "<C-m>", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-n>", function() harpoon:list():remove() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  }
}

lvim.keys.normal_mode["gG"] = ":lua require('omnisharp_extended').lsp_definition()<cr>"
