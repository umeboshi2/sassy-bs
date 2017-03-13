# sassy-bs

This is a simple way to create css for multiple web projects. Compass is used, along with bootstrap-sass and font-awesome.  The goal of this project is to have a common repository of sass/scss files for multiple projects that use both bootstrap and font-awesome.  This will help eliminate dependencies that may not be needed on each project.

If you do not need to tweak your css styles very often, and do not want each project to depend on ruby and compass, this may work for you.

Currently, this repository only supports a single, yet mostly convential, directory structure.  CSS files are to be located in the ```assets/stylesheets``` directory, with the bootstrap and font-awesome icons located in the ```assets/fonts``` directory.  The ```assets/fonts``` directory layout should look the same as the layout in this repository.

I plan to update the configuration in the future to make this more flexible.

TODO:

- Use a common ```partials/``` directory.

- Identify particular css files to be built for each project.
  (currently all css defined in sass/ folder gets written to all projects.)
  
- Make more coherent and consistent per project font paths, and stylesheet 
  paths, using the "assets" layout as default.
  
  
  
