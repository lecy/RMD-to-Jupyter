# RMD-to-Jupyter

This project provides a convenient R function for translating R Markdown (.rmd) files to Jupyter Notebook (.ipynb) files.


# Setup

## Windows

1. First install [R](https://www.r-project.org/)
2. Then write in R console 
    ```
    install.packages('knitr', dependencies = TRUE)
    ```
3. Next we need to install notedown and other depencies 
    ```
    pip install notedown 
    pip install pandas 
    pip install ipython[all] 
    pip install ipykernel 
    ipython kernel install 
    ``` 
4. To install rpy2 try `pip install rpy2` or [download binaries](http://www.lfd.uci.edu/~gohlke/pythonlibs/#rpy2) `pip install filename.whl`
5. Set variable `R_USER` to your profile path (example `C:\Users\Mentos` ) and add in `Path` variable your R path (example `C:\Program Files\R\R-3.2.3\bin`) 


## Ubuntu
First install pip
```
sudo apt-get install python3-setuptools
```
Then install notedown
```
sudo pip3 install notedown
```
You need to install R and knitr. Go to https://cran.r-project.org/mirrors.html and choose your mirror. Then click "Download for Linux", after that click "Ubuntu". Then add line to file `/etc/apt/sources.list`
```
deb https://<my.favorite.cran.mirror>/bin/linux/ubuntu wily/
```
Where wily is your Ubuntu version. After that to install R write 
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update
sudo apt-get install r-base
```
For install knitr use command on R
```
install.packages('knitr', dependencies = TRUE)
```
Now install all depencies.
```
sudo pip3 install jupyter_client
sudo pip3 install ipykernel
sudo ipython3 kernel install
sudo pip3 install rpy2
```
### Script for R
```
library(tools)

rmd2jupiter <- function( filename, path=getwd() ) 
{
  path_in <- paste( path, "/", filename, " ", sep="" )
  path_out <- paste(path, "/", file_path_sans_ext(filename), ".ipynb", sep="")
  full_shell <- paste("notedown ", path_in, " --rmagic --run > ", path_out, sep="")
  shell(full_shell)
}

# download the example.Rmd file from this repository
# setwd(...) to where the example.Rmd file is located
rmd2jupiter( "example.Rmd" )
```
### Questions
If something doesn't work please send me log.
