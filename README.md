# Package development in R

The folder `ghc` contains the R package we used in a previous assignment. 
We have now fixed all of the package dependencies. This time, we want to focus on 
error messages around variable definitions and expanding the functionality.

1. Make sure that you have opened RStudio from the project `ghc.Rproj` in the ghc folder. 
2. Run `R CMD check` (either from the `Build` tab or by running `devtools::check()` in the console).
3. One set of warnings/notes has the form `Undocumented arguments` or `Documented arguments`. Both of these types indicate a problem with the documentation. Look closely and fix these issues.
4. The set of notes regarding `no visible binding for global variable` refer to ambiguities in scoping, i.e. whether an object is a variable in the data set or a parameter in the environment. Resolve these ambiguities.
5. Create a function `since_created` that works similarly to `last_pushed` but also returns the number of seconds between the last push and the repositories creation.
Make sure that you are not adding any additional problems to `R CMD check`.
