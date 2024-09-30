return {
  "shortcuts/no-neck-pain.nvim",
    version = "*",

  config = function()
   -- set keymaps
   local keymap = vim.keymap
   keymap.set("n", "<leader>nn", "<cmd>NoNeckPain<cr>", { desc = "[N]o [N]eckpain" })
    end
}
