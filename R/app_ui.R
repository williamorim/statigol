#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    shinyWidgets::useBs4Dash(),
    # Your application UI logic
    navbarPage(
      title = "statigol",
      theme = bslib::bs_theme(version = 4),
      tabPanel(
        title = "Home"
      ),
      navbarMenu(
        title = "Brasileirão",
        tabPanel(
          title = "Página inicial"
        ),
        tabPanel(
          title = "Times"
        ),
        tabPanel(
          title = "Estatísticas"
        ),
        tabPanel(
          title = "Recordes"
        )
      ),
      tabPanel(
        title = "Sobre"
      ),
      footer = tags$footer(
        fluidRow(
          column(
            width = 4,
            p(
              "Desenvolvido em",
              a(href = "https://shiny.rstudio.com/", "Shiny"),
              "por",
              a(href = "https://twitter.com/home", "William Amorim")
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "statigol"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
