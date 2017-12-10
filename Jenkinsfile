node {
   echo 'Hello World'
   
   echo "Build Number is: ${env.BUILD_NUMBER}"
   
   sh 'env > env.txt' 
   for (String i : readFile('env.txt').split("\r?\n")) {
       println i
   }
}