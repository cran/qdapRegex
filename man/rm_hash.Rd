% Generated by roxygen2 (4.0.2): do not edit by hand
\name{rm_hash}
\alias{rm_hash}
\title{Remove/Replace/Extract Hash Tags}
\usage{
rm_hash(text.var, trim = !extract, clean = TRUE, pattern = "@rm_hash",
  replacement = "", extract = FALSE,
  dictionary = getOption("regex.library"), ...)
}
\arguments{
\item{text.var}{The text variable.}

\item{trim}{logical.  If \code{TRUE} removes leading and trailing white
spaces.}

\item{clean}{trim logical.  If \code{TRUE} extra white spaces and escaped
character will be removed.}

\item{pattern}{A character string containing a regular expression (or
character string for \code{fixed = TRUE}) to be matched in the given
character vector.  Default, \code{@rm_hash} uses the
\code{rm_hash} regex from the regular expression dictionary from
the \code{dictionary} argument.}

\item{replacement}{Replacement for matched \code{pattern}.}

\item{extract}{logical.  If \code{TRUE} the hash tags are extracted into a
list of vectors.}

\item{dictionary}{A dictionary of canned regular expressions to search within
if \code{pattern} begins with \code{"@rm_"}.}

\item{\dots}{Other arguments passed to \code{\link[base]{gsub}}.}
}
\value{
Returns a character string with hash tags removed.
}
\description{
Remove/replace/extract hash tags from a string.
}
\examples{
x <- c("@hadley I like #rstats for #ggplot2 work.",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
        presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
)

rm_hash(x)
rm_hash(rm_tag(x))
rm_hash(x, extract=TRUE)
}
\author{
\href{http://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@gmail.com>.
}
\references{
The hash tag regular expression was taken from:
\url{http://stackoverflow.com/a/25096474/1000343}
}
\seealso{
\code{\link[base]{gsub}},
\code{\link[stringi]{stri_extract_all_regex}}
}
\keyword{hash}
\keyword{twitter}
