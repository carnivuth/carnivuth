---
title: "Neovim"
description: "nvim personal reference"
date: 2025-01-20
series: ["Technologies notes"]
draft: false
series_order: 12
tags:
  - neovim
  - lsp
  - dotfiles
---

Neovim is a vim fork with builtin lsp client, support for lua scripting, and retro compatibility with the old vimscript language

## Language server protocol in neovim

it's a standard protocol  to manage interaction between code editors and process providing code completion and  syntax highlighting

{{< mermaid >}}
flowchart LR
subgraph editors
direction TB
A[vim]
B[nvim]
C[vscode]
end
subgraph language_servers
direction TB
D[C]
E[ansiblels]
F[dockerls]
end
editors --send file content--> language_servers
language_servers --code completition--> editors
{{</ mermaid >}}

Neovim provides integrated support as it feature a builtin LSP client, in my personal configuration this plugins are also enabled to improve the LSP management experience

- [mason](https://github.com/williamboman/mason.nvim) for LSP installation
- [lspconfig](https://github.com/neovim/nvim-lspconfig) for LSP configuration
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) for automatic LSP management

## Add a language server

Language servers needs to be installed with `mason` and then activated with `lspconfig` then when the correspondent filetype is detected lspconfig will start the server and attach the client to it for the active buffer

```vimscript
:MasonInstall
:lua require("lspconfig").hyprls.setup{}
```

To check if a language server is running correctly run `:LspInfo`

```text
lspconfig: require("lspconfig.health").check()

LSP configs active in this session (globally)
- Configured servers: lua_ls, ansiblels, gopls, pyright, bashls, terraformls, docker_compose_language_service, dockerls, eslint
- OK Deprecated servers: (none)

LSP configs active in this buffer (bufnr: 1)
- Language client log: ~/.local/state/nvim/lsp.log
- Detected filetype: yaml
- 0 client(s) attached to this buffer

Docs for active configs:
```

## Setting filetype

In order to limit a language server to a specific set of files (*e.g. `ansiblels`*) configure lspconfig to run the LSP server on a specific filetype (`ansible`) and configure neovim to set the filetype for the specific set of file

```lua
-- in nvim filetypes configuration
vim.filetype.add({pattern = { [".*/playbooks/.*%.yml"] = "ansible" },})
vim.filetype.add({pattern = { [".*/playbooks/.*%.yaml"] = "ansible" },})
vim.filetype.add({pattern = { [".*/roles/.*%.yml"] = "ansible" },})
vim.filetype.add({pattern = { [".*/roles/.*%.yaml"] = "ansible" },})

-- in the lspconfig file
-------------------------------------
require('lspconfig').ansiblels.setup{
	filetypes ={"ansible"};
}
------------------------------------
```

The `pattern` objects requires a [lua pattern](https://www.lua.org/manual/5.1/manual.html#5.4.1) as argument

## Quick command reference

- To add argument to the command line inside vim (*e.g. to add file and also buffers*)

```vim
" path expansion is allowed
:argadd [path/to/file/]
```

- To run a specific command in all open buffers

```vim
" run find and replace
bufdo %s/\](assets\/pages\/\(.*\/Pasted.*\))/](assets\/\1)/gc | update |bw

" indent
bufdo execute "normal! ggvG=l" | update |bw
```

- replace visually highlighted text without overwrite content inside default register

```vimscript
v
"  highlight text
yv
"  highlight text to overwrite
P
```
