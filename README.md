# RMD-to-Jupyter

This project provides a convenient R function for translating R Markdown (.rmd) files to Jupyter Notebook (.ipynb) files. 

The major advantage to using notebook instead of markdown files is the ability to post them on GitHub, where the HTML version is automatically rendered so that the users can view the full output instead of just the code. For example, here is an R Markdown and a Jypyter notebook file for comparison:

[Example R Markdown](https://github.com/lecy/RMD-to-Jupyter/example.Rmd)
[Example Jupyter Notebook](https://github.com/lecy/RMD-to-Jupyter/example.ipynb)

A recent R Revolutions blog explains more details:

http://blog.revolutionanalytics.com/2015/09/using-r-with-jupyter-notebooks.html

Another solution has been proposed using the [ipyrmd script](https://github.com/chronitis/ipyrmd).

The example code was provided by [Ramnath Vaidyanathan](https://bl.ocks.org/ramnathv/9334834)



# Setup

Here are some basic instructions to guide you through the installation of necessary software in order to convert markdown files to notebooks. Windows and Ubuntu scenarios are covered (mac users, you are on your own).


## Windows

Running this program requires that you have R, Python, and Jupyter installed you your machine.



1. First install [R](https://www.r-project.org/)

2. You need to install the `knitr` package. From R, type:

    ```
    install.packages('knitr', dependencies = TRUE)
    ```

3. You need to add `R_USER` to your system profile path. In Windows, look under Control Panel > Advanced System Settings > Environmental Variables > path.

   You will add the path for your R bin folder to this setting. For example, change:

   `C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\`
   to:
   `C:\R\R-3.2.2\bin;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\`
   
   [View a screenshot](http://www.faqforge.com/wp-content/uploads/2012/01/path.png)
   

4. We now need to install Python and the proper Python libraries. To start, you will need to decide which version of Python to install:
   
   http://jupyter.readthedocs.org/en/latest/install.html

5. Next you need to install the libraries. For `pandas` from a command prompt try:

   ```pip install pandas``` 
   
   You may have trouble with the `num`
   
   [download binaries here](http://www.lfd.uci.edu/~gohlke/pythonlibs/#numpy) and then try:

   ```pip install filename.whl```
   
   where `filename.whl` is replaced with the proper file name from the download above. Then try:
   
    ```pip install pandas```   
   
   
5. Next we need to install notedown and other depencies. Using a command prompt: 

    ```
    pip install notedown 
    pip install pandas 
    pip install ipython[all] 
    pip install ipykernel 
    ipython kernel install 
    ``` 


6. To install rpy2 try: 

   ```pip install rpy2``` 
   
   or [download binaries](http://www.lfd.uci.edu/~gohlke/pythonlibs/#rpy2) and then try:
   
   ```pip install filename.whl```
   
   where `filename.whl` is replaced with the proper file name from the download above.






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


## Script for R

In order to convert an R Markdown file into a Jupyter Notebook, you can type the following into a command prompt window:

```
notedown path/example.Rmd  --rmagic --run > path/example.ipynb
```
where `path/` would be replaced with the proper parameters, such as:

```
notedown C:/Users/YourMom/Documents/example.Rmd  --rmagic --run > C:/Users/YourMom/Documents/example.ipynb
```

The command will create a new .ipynb file within the specified directory, ready to post on GitHub or share with colleagues.

The following R script is a helper function so this can be implemented from within R.

```
library(tools)

rmd2jupyter <- function( filename, path=getwd() ) 
{
  path_in <- paste( path, "/", filename, " ", sep="" )
  path_out <- paste(path, "/", file_path_sans_ext(filename), ".ipynb", sep="")
  full_shell <- paste("notedown ", path_in, " --rmagic --run > ", path_out, sep="")
  shell(full_shell)
}

# download the example.Rmd file from this repository
# setwd(...) to where the example.Rmd file is located

rmd2jupyter( "example.Rmd" )

```


## Suggestions

Jupyter notebooks provide an interesting way to share interactive R code and output. If you have suggestions for good resources, methods, or scripts to make this process easier please send them (or submit a pull request) and I will add them to this page.

Thanks to Mikhail Mityaev for an initial version of the R script.


