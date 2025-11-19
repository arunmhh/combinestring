bare_combine <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      bits <- utils::read.csv(text = ctx$selection[[1]]$text,
                              stringsAsFactors = FALSE,
                              header = FALSE)

      bits <- unlist(bits, use.names = FALSE)

      op <- options("useFancyQuotes")
      options(useFancyQuotes = FALSE)

      bits <- sapply(bits, trimws)
      bits <- sapply(bits, dQuote)

      options(op)

      bits <- paste0(bits, collapse = ", ")
      bits <- sprintf("c(%s)", bits)

      rstudioapi::modifyRange(ctx$selection[[1]]$range, bits)

    }

  }

}
