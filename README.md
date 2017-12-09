# sassy-bs

This is a simple way to create css for multiple web projects. Compass is used, along with bootstrap-sass and font-awesome.  The goal of this project is to have a common repository of sass/scss files for multiple projects that use both bootstrap and font-awesome.  This will help eliminate dependencies that may not be needed on each project.

If you do not need to tweak your css styles very often, and do not want each project to depend on ruby and compass, this may work for you.

## Limitations
Currently, this repository only supports a single, yet mostly convential, directory structure.  CSS files are to be located in the ```assets/stylesheets``` directory, with the bootstrap and font-awesome icons located in the ```assets/fonts``` directory.  The ```assets/fonts``` directory layout should look the same as the layout in this repository.

Also, apparently due to how compass works, css files will be created in the ```assets/stylesheets``` directory in this repository, which probably will not be needed.  This is not a show stopper, yet a pesky bit of ugliness.


## TODO

I plan to update the configuration in the future to make this more flexible.

- Use a common ```partials/``` directory.

- Identify particular css files to be built for each project.
  (currently all css defined in sass/ folder gets written to all projects.)
  
- Make more coherent and consistent per project font paths, and stylesheet 
  paths, using the "assets" layout as default.
  
  
## Instructions

- Clone the repository

	```git clone https://github.com/umeboshi2/sassy-bs.git```

- Install dependencies

	```sh
	cd sassy-bs
	bundle install
	npm install
	```
- Create project file

	Here is an example object that is needed by gulp to direct the 
	compass compiler:

	```json
	{
		"proj1": {
			"css": "/freespace/home/umeboshi/workspace/proj1/assets/stylesheets"
		},
		"proj2": {
			"css": "/freespace/home/umeboshi/workspace/proj2/assets/stylesheets"
		}
	}
	```

	The gulpfile performs ```require("./projects");```js to get the 
	configuration.  The projects file can be ```'.js', '.json', or 
	'.coffee'```.  The files should be resolved in such order 
	by ```require``.  If using a module for configuration, the exported 
	object should conform to the JSON output above.

- Create stylesheets for a project:

	``` gulp --proj1``` where (proj1) is one of the properties of the 
	exported object defined in ```./projects```.
	


- Google fonts

	- https://google-webfonts-helper.herokuapp.com/api/fonts/architects-daughter?download=zip&subsets=latin&variants=regular
	
	- https://google-webfonts-helper.herokuapp.com/api/fonts/rambla?download=zip&subsets=latin&variants=700,regular,italic
	
	- https://google-webfonts-helper.herokuapp.com/api/fonts/source-sans-pro?download=zip&subsets=latin&variants=600,700,regular,italic
	
	- https://google-webfonts-helper.herokuapp.com/api/fonts/play?download=zip&subsets=latin&variants=700,regular
	
