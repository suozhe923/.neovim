return {  
    {  
        "nvim-treesitter/nvim-treesitter",  
        run = ":TSUpdate",  -- 更新 Tree-sitter 语言包  
        config = function()  
            require'nvim-treesitter.configs'.setup {  
                ensure_installed = "all",  -- 安装所有支持的语言  
                highlight = {  
                    enable = true,  -- 启用高亮功能  
                    additional_vim_regex_highlighting = false,  -- 不使用 Vim 的 regex 高亮  
                },  
                -- 其他 Tree-sitter 配置...  
            }  
        end  
    },  
}
