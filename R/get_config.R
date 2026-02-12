#' Get config value from a list of possible config files
#'
#' Looks for `key` in the first existing file that contains it.
#' Returns `NULL` if the key is not found anywhere.
#'
#' @param key Character scalar. Config key to read.
#' @param default_file Character vector of candidate file paths (in priority order).
#' @return The config value if found, otherwise NULL.
#' @export
get_config <- function(key, default_file = c("config.yml")) {
  stopifnot(is.character(key), length(key) == 1, nzchar(key))
  if (!is.character(default_file) || length(default_file) < 1) {
    default_file <- c("config.yml")
  }
  
  safe_get <- function(path) {
    if (is.null(path) || length(path) != 1 || is.na(path) || !nzchar(path)) return(NULL)
    path <- path.expand(path)
    if (!file.exists(path)) return(NULL)
    
    # config::get errors if key missing; we turn that into NULL
    tryCatch(config::get(key, file = path), error = function(e) NULL)
  }
  
  # Try local first (working dir)
  val <- safe_get("config.yml")
  if (!is.null(val)) return(val)
  
  # Then the provided candidate paths
  for (f in default_file) {
    val <- safe_get(f)
    if (!is.null(val)) return(val)
  }
  
  NULL
}