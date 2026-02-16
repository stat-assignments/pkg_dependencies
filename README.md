# Package development in R

The folder `ghc` contains an R package in the early stages of development. 
We will use this package to go through some of the (error) messages that `R CMD check` identifies during the checking process.

1. Make sure that you have opened RStudio from the project `ghc.Rproj` in the ghc folder. 
2. Run `R CMD check` (either from the `Build` tab or by running `devtools::check()` in the console).
3. Ensure that roxygen versions match.
4. Why does the package need a dependency on R (>= 4.1.0)?
5. The warning under `checking dependencies in R code` and the notes under `checking R code for possible problems` are mostly due to missing specifications on other packages.
Use the command `usethis::use_package()` to resolve one of these dependencies. 
6. Why is it a bad idea to follow the following advice?
```
Consider adding
    importFrom("stats", "as.dist", "cutree", "filter", "hclust")
    importFrom("utils", "menu")
  to your NAMESPACE file.
```
7. Identify a different strategy to get rid of the above suggestion (by -indirectly- adjusting the NAMESPACE file). Make sure that the advice is gone.
8. Which of the other problems can be addressed by specifying dependencies correctly?
