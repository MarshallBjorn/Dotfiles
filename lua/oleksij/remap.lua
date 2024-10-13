vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Вихід з файла за допомогою Пробіл+p+v"})
vim.keymap.set("i", "jk", "<ESC>", {desc = "Вихід з режиму набирання за допомогою j+k"})
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Вичищення підсвічуваних слів в часі пошуку з Пробіл+n+h"})

vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Розбиває вікно горизонтально"})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Розбиває вікно вертикально"})
vim.keymap.set("n", "<leader>se", "<C-w>=", {desc = "Вирівнює вікна"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Закрити текуще вікно"})
