#' Combine selected text into a character vector
#'
#' This addin takes the currently selected text in the RStudio editor,
#' splits it into elements, and converts it into a quoted character vector.
#'
#' @import rstudioapi
#' @import utils
#' @export
bare_combine <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (is.null(ctx)) return(invisible())

  sel <- ctx$selection[[1]]$text
  if (identical(sel, "")) return(invisible())

  bits <- utils::read.csv(
    text = sel,
    stringsAsFactors = FALSE,
    header = FALSE
  )

  bits <- unlist(bits, use.names = FALSE)
  bits <- trimws(bits)

  original_opts <- options("useFancyQuotes")
  on.exit(options(original_opts), add = TRUE)
  options(useFancyQuotes = FALSE)

  bits <- sapply(bits, dQuote)
  result <- sprintf("c(%s)", paste0(bits, collapse = ", "))

  rstudioapi::modifyRange(ctx$selection[[1]]$range, result)

  invisible()
}

