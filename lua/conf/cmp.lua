local cmp = require'cmp'
local util = require 'lspconfig.util'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
equire("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require'lspconfig'.java_language_server.setup {
--    default_config = {
--    filetypes = { 'java' },
--    root_dir = util.root_pattern('build.gradle', 'pom.xml', '.git'),
--    settings = {},
--    docs = {
--    description = [[
--https://github.com/georgewfraser/java-language-server
--
--Java language server
--
--Point `cmd` to `lang_server_linux.sh` or the equivalent script for macOS/Windows provided by java-language-server
--]],
--  },
--  }
--}
require'lspconfig'.jdtls.setup{ 
    default_config = {
    cmd = { 'jdtls' },
    filetypes = {'java'},
    init_options = {
        jvm_args = {},
        workspace = "/home/user/.cache/jdtls/workspace"
    },
    },
    single_file_support = true
}
require'lspconfig'.pyright.setup{
    { "pyright-langserver", "--stdio" },
    { "python" },
    {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }
}
require'lspconfig'.clangd.setup{
    default_config = {
        capabilities = {
            offsetEncoding = {"utf-8","utf-16"},
            textDocument = {
                completion = {editsNearCursor = ture}
            }
        },
        cmd = {'clangd','--background-index','--clang-tidy','--log=verbose'},
        filetypes = {"c","cpp","objc","objcpp","cuda","proto"},
        single_file_support = true,
        init_options = {
            fallbackFlags = {'-std=c++17'}
        }
    }
}

--find lsp in this web
--https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
