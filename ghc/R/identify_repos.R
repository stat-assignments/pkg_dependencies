#' Identify a set of repos from an organization
#'
#' @param course organization to check
#' @param f function to be called with the selected repos
#' @return function call to f with the identified repos
#' @export
ghc <- function(course = "451", f) {
#  library(dplyr)
  # get repos
  repos <- get_org_repos(sprintf("stat%s-at-unl", course))
  names <- repos |> purrr::map_chr(.f=function(x) x |> purrr::pluck("name"))
  repos_df <- data.frame(names = sort(names))
  repos_dist <- distance_matrix(repos_df$names, "jw", p = .1)

  clust <- hclust(as.dist(repos_dist))
  repos_df$cluster <- cutree(clust, h = 0.25)
  repos_df <- repos_df |> group_by(cluster) |> mutate(
    prefix = longest_common_prefix(names)
  )

  folders <- repos_df |> group_by(cluster) |>
    summarize(
      prefix = prefix[1],
      choice = sprintf("%s (%d)", prefix, n()),
      n = n()
    ) |> arrange(desc(n), prefix) |>
    filter(n >= 2)
  # which assignment do you want to deal with?
  selection <- menu(folders$choice, title="Which assignment?")

  selected <- repos_df |> filter(prefix == folders$prefix[selection])
  repos_selected <- repos |> purrr::keep(.p = function(x) x$name %in% selected$names)

  f(repos_selected, selected$prefix[1])
}
