rmd2jupyter <- function( filename, path=getwd() ) 
{
  path_in <- paste( path, "/", filename, " ", sep="" )
  path_out <- paste(path, "/", file_path_sans_ext(filename), ".ipynb", sep="")
  full_shell <- paste("notedown ", path_in, " --rmagic --run > ", path_out, sep="")
  shell(full_shell)
}
