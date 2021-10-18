module.exports = {
   
     
      // SASS has different line endings than SCSS
      // and cannot use semicolons in the markup
      
 
      // SCSS has different line endings than SASS
      // and needs a semicolon after the import.
       
        test: /\.scss$/,
        use: [
          'vue-style-loader',
 
          {
            loader: 'sass-loader',
     
            // Requires sass-loader@^8.0.0
            options: {
              // This is the path to your variables
              prependData: "@import '@/javascript/stylesheets/scss/_variables.scss';"
            },
       
          },
        ],
       
     
   
}