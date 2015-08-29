/motorcycle-licence-requirements/{
   mcount++
   if(mcount == 2){
       sub("motorcycle-licence-requirements","motorcycle-licence-requirements1",$0)
   }
}

{print}
