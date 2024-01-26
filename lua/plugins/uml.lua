return {
  {
    "weirongxu/plantuml-previewer.vim",
    -- event = {"VimEnter *.uml"},
    ft = { "plantuml", "uml", "puml" },
    config = function()
      -- vim.g.plantuml_previewer = "http://www.plantuml.com/plantuml/img/"
      vim.g.plantuml_previewer_plantuml_jar_path = "/opt/plantuml/plantuml.jar"
    end,
  },
  {
    "tyru/open-browser.vim",
    -- event = { "VimEnter *.uml" },
    ft = { "plantuml", "uml", "puml" },
  },
  {
    "aklt/plantuml-syntax",
    ft = { "plantuml", "uml", "puml" },
    -- event = { "VimEnter *.uml" },
  },
}

