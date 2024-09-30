vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


-- Set movement keys without recursive mapping
keymap.set({ "n", "v" }, "t", "h", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "n", "j", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "m", "k", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "s", "l", { noremap = true, silent = true, nowait = true })

-- Map j to go to the next search match (like n used to)
keymap.set({ "n", "v" }, "j", "n", { noremap = true, silent = true })

-- Map J to go to the previous search match (like N used to)
keymap.set({ "n", "v" }, "J", "N", { noremap = true, silent = true })

-- Map gN to join below line without space in between (like gJ used to do)
-- keymap.set("n", "gN", "gJ", { noremap = true, silent = true })

-- Map N to join below line with one space in between (like J used to do)
keymap.set("n", "N", "J", { noremap = true, silent = true })

-- prev word, next word and end next word
keymap.set({ "n", "v" }, "h", "b", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "H", "B", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "k", "w", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "K", "W", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "b", "e", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "B", "E", { noremap = true, silent = true })

-- BOL, EOL and Soft BOL
keymap.set({ "n", "v" }, "å", "0", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "ö", "$", { noremap = true, silent = true })
keymap.set({ "n", "v" }, "Å", "_", { noremap = true, silent = true })

-- Remap s with ä
vim.keymap.set({ "n", "v" }, "ä", "s", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "Ä", "S", { noremap = true, silent = true })

-- scrolling

keymap.set({"n", "v"}, "<C-f>", "<C-d>")
keymap.set({"n", "v"}, "<C-d>", "<C-u>")

-- highlight search clear
keymap.set({"n", "v"}, "<esc><esc>", ":noh<CR>")

-- easy indentation keymap.set("v", "<", "<gv")
-- keymap.set("v", ">", ">gv")

-- Preserve cursor position when opening newlines and return to normal mode
keymap.set("n", "oo", "m`o<Esc>``", { noremap = true, silent = true })
keymap.set("n", "OO", "m`O<Esc>``", { noremap = true, silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


