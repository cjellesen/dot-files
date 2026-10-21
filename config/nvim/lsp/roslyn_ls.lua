return {
    cmd = {
        "roslyn-language-server",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
        "--autoLoadProjects"
    },
    filetypes = { "cs" },
    root_markers = {
        ".csproj",
        ".sln",
        ".git",
    },
    settings = {
        ["csharp|background_analysis"] = {
            -- 'fullSolution', 'openFiles'
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "fullSolution",
        },
        ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
        },
        ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
        ["csharp|navigation"] = {
            dotnet_navigate_to_decompiled_sources = true,
            dotnet_navigate_to_source_link_and_embedded_sources = true
        },
        ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ['csharp|completion'] = {
            dotnet_show_name_completion_suggestions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_provide_regex_completions = true,
        },
    },
    -- For general documentation of LSP capabilities see:
    --  'https://microsoft.github.io/language-server-protocol/'
    --  'https://lsp-devtools.readthedocs.io/en/latest/index.html'
    capabilities = {
        diagnosticProvider = {
            interFileDependencies = true,
            workspaceDiagnostics = true,
        },
        textDocument = {
            callHierarchy = {
                dynamicRegistration = false
            },
            codeAction = {
                dynamicRegistration = true,
                isPreferredSupport = true,
                dataSupport = true,
                properties = { "edit", "command" },
                honorsChangeAnnotations = true
            },
            codeLens = {
                dynamicRegistration = true,
            },
            completion = {
                dynamicRegistration = true,
                contextSupport = true,
                insertTextMode = 2,
                completionItem = {
                    snippetSupport = true,
                    commitCharactersSupport = false,
                    documentationFormat = { "markdown" },
                    deprecatedSupport = true,
                    preselectSupport = true,
                    insertReplaceSupport = true,
                    labelDetailsSupport = true,
                    resolveSupport = {
                        properties = { "additionalTextEdits", "command" }
                    },
                },
                completionList = {
                    itemDefaults = { "editRange", "insertTextFormat", "insertTextMode", "data" }
                }
            },
            declaration = {
                dynamicRegistration = true,
                linkSupport = true
            },
            definition = {
                dynamicRegistration = true,
                linkSupport = true,
            },
            diagnostic = {
                dynamicRegistration = true,
                relatedDocumentSupport = true,
            },
            documentSymbol = {
                dynamicRegistration = true,
                hierarchicalDocumentSymbolSupport = true,
                labelSupport = true,
            },
            formatting = {
                dynamicRegistration = true
            },
            hover = {
                dynamicRegistration = true,
                contentFormat = { "markdown" }
            },
            implementation = {
                dynamicRegistration = true,
                linkSupport = true
            },
            inlayHint = {
                dynamicRegistration = true,
                resolveSupport = {
                    properties = { "textEdits", "tooltip", "location", "command" }
                }
            },
            inlineValue = {
                dynamicRegistration = true,
            },
            publishDiagnostics = {
                relatedInformation = true,
                versionSupport = true,
                codeDescriptionSupport = true,
                dataSupport = true,
            },
            rangeFormatting = {
                dynamicRegistration = true
            },
            references = {
                dynamicRegistration = true
            },
            rename = {
                dynamicRegistration = true,
                prepareSupport = true,
                honorsChangeAnnotations = true,
            },
            signatureHelp = {
                dynamicRegistration = true,
                contextSupport = true,
                signatureInformation = {
                    activeParameterSupport = true,
                    parameterInformation = {
                        labelOffsetSupport = true
                    }
                }
            },
            synchronization = {
                dynamicRegistration = true,
                didSave = true,
                willSave = true,
                willSaveWaitUntil = true
            },
            typeDefinition = {
                dynamicRegistration = true,
                linkSupport = true
            },
            typeHierarchy = {
                dynamicRegistration = true
            }
        },
        window = {
            workDoneProgress = true,
            showDocument = {
                support = true
            },
            showMessage = {
                messageActionItem = {
                    additionalPropertiesSupport = true
                }
            }
        },
        workspace = {
            applyEdit = true,
            codeLens = {
                refreshSupport = true,
            },
            configuration = true,
            diagnostics = {
                refreshSupport = true,
                relatedDocumentSupport = true,
            },
            inlayHint = {
                refreshSupport = true
            },
            inlineValue = {
                refreshSupport = true
            },
            semanticTokens = {
                refreshSupport = true
            },
            symbol = {
                dynamicRegistration = true,
            },
        },
    },
    log_level = vim.lsp.protocol.MessageType.Warning,
}
