local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true });
end

local custom_attach = function(client)
	print("LSP server started.");
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)

	map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n', 'gd', '<cmd>lua vfim.lsp.buf.definition()<CR>')
end

lsp.tsserver.setup{on_attach=custom_attach}
