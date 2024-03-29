% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rm_between.R
\name{rm_between}
\alias{rm_between}
\alias{rm_between_multiple}
\alias{ex_between}
\alias{ex_between_multiple}
\title{Remove/Replace/Extract Strings Between 2 Markers}
\usage{
rm_between(
  text.var,
  left,
  right,
  fixed = TRUE,
  trim = TRUE,
  clean = TRUE,
  replacement = "",
  extract = FALSE,
  include.markers = ifelse(extract, FALSE, TRUE),
  dictionary = getOption("regex.library"),
  ...
)

rm_between_multiple(
  text.var,
  left,
  right,
  fixed = TRUE,
  trim = TRUE,
  clean = TRUE,
  replacement = "",
  extract = FALSE,
  include.markers = FALSE,
  merge = TRUE
)

ex_between(
  text.var,
  left,
  right,
  fixed = TRUE,
  trim = TRUE,
  clean = TRUE,
  replacement = "",
  extract = TRUE,
  include.markers = ifelse(extract, FALSE, TRUE),
  dictionary = getOption("regex.library"),
  ...
)

ex_between_multiple(
  text.var,
  left,
  right,
  fixed = TRUE,
  trim = TRUE,
  clean = TRUE,
  replacement = "",
  extract = TRUE,
  include.markers = FALSE,
  merge = TRUE
)
}
\arguments{
\item{text.var}{The text variable.}

\item{left}{A vector of character or numeric symbols as the left edge to 
extract.}

\item{right}{A vector of character or numeric symbols as the right edge to 
extract.}

\item{fixed}{logical.  If \code{TRUE} regular expression special characters 
(\code{c(".", "|", "(", ")", "[", "]", "{", "}", "^", "$", "*", "+", "?")})
will be treated as typical characters.  If the user wants to pass a regular 
expression with special characters then \code{fixed = FALSE} should be used.}

\item{trim}{logical.  If \code{TRUE} removes leading and trailing white 
spaces.}

\item{clean}{trim logical.  If \code{TRUE} extra white spaces and escaped 
character will be removed.}

\item{replacement}{Replacement for matched \code{pattern}.}

\item{extract}{logical.  If \code{TRUE} the strings are extracted into a 
list of vectors.}

\item{include.markers}{logical.  If \code{TRUE} and \code{extract = TRUE} returns 
the markers (left/right) and the text between.}

\item{dictionary}{A dictionary of canned regular expressions to search within 
if \code{pattern} begins with \code{"@rm_"}.}

\item{\dots}{Other arguments passed to \code{\link[base]{gsub}}.}

\item{merge}{logical.  If \code{TRUE} the results of each bracket type will 
be merged by string.  \code{FALSE} returns a named list of lists of vectors 
of markered text per marker type.}
}
\value{
Returns a character string with markers removed.  If 
\code{rm_between} returns merged strings and is significantly faster.  If
\code{rm_between_multiple} the strings are optionally merged by 
\code{left}/\code{right} symbols.  The latter approach is more flexible and
names extracted strings by symbol boundaries, however, it is slower than 
\code{rm_between}.
}
\description{
Remove/replace/extract strings bounded between a left and right marker.
}
\examples{
x <-  "I like [bots] (not)."

rm_between(x, "(", ")")
ex_between(x, "(", ")")
rm_between(x, c("(", "["), c(")", "]"))
ex_between(x, c("(", "["), c(")", "]"))

rm_between(x, c("(", "["), c(")", "]"), include.markers=FALSE)
ex_between(x, c("(", "["), c(")", "]"), include.markers=TRUE) 

## multiple (naming and ability to keep separate bracket types but slower)
x <- c("Where is the /big dog#?",
    "I think he's @arunning@b with /little cat#.")

rm_between_multiple(x, "@a", "@b")
ex_between_multiple(x, "@a", "@b")
rm_between_multiple(x, c("/", "@a"), c("#", "@b"))
ex_between_multiple(x, c("/", "@a"), c("#", "@b"))

x2 <- c("Where is the L1big dogL2?",
    "I think he's 98running99 with L1little catL2.")
rm_between_multiple(x2, c("L1", 98), c("L2", 99))
ex_between_multiple(x2, c("L1", 98), c("L2", 99))

state <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
    "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
    "How can we be certain?", "There is no way.", "I distrust you.", 
    "What are you talking about?", "Shall we move on?  Good then.", 
    "I'm hungry.  Let's eat.  You already?")

rm_between_multiple(state, c("is", "we"), c("too", "on"))

## Use Grouping
s <- "something before stuff $some text$ in between $1$ and after"
rm_between(s, "$", "$", replacement="<B>\\\\2<E>")

## Using regular expressions as boundaries (fixed =FALSE)
x <-  c(
    "There are 2.3 million species in the world",
    "There are 2.3 billion species in the world"
)

ex_between(x, left='There', right = '[mb]illion', fixed = FALSE, include=TRUE)
}
\seealso{
\code{\link[base]{gsub}},
\code{\link[qdapRegex]{rm_bracket}},
\code{\link[stringi]{stri_extract_all_regex}}

Other rm_ functions: 
\code{\link{rm_abbreviation}()},
\code{\link{rm_bracket}()},
\code{\link{rm_caps_phrase}()},
\code{\link{rm_caps}()},
\code{\link{rm_citation_tex}()},
\code{\link{rm_citation}()},
\code{\link{rm_city_state_zip}()},
\code{\link{rm_city_state}()},
\code{\link{rm_date}()},
\code{\link{rm_default}()},
\code{\link{rm_dollar}()},
\code{\link{rm_email}()},
\code{\link{rm_emoticon}()},
\code{\link{rm_endmark}()},
\code{\link{rm_hash}()},
\code{\link{rm_nchar_words}()},
\code{\link{rm_non_ascii}()},
\code{\link{rm_non_words}()},
\code{\link{rm_number}()},
\code{\link{rm_percent}()},
\code{\link{rm_phone}()},
\code{\link{rm_postal_code}()},
\code{\link{rm_repeated_characters}()},
\code{\link{rm_repeated_phrases}()},
\code{\link{rm_repeated_words}()},
\code{\link{rm_tag}()},
\code{\link{rm_time}()},
\code{\link{rm_title_name}()},
\code{\link{rm_url}()},
\code{\link{rm_white}()},
\code{\link{rm_zip}()}
}
\concept{rm_ functions}
