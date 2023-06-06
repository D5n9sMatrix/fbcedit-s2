'  library freebasic edit-s2 
#ifdef __fb_cygwin__
declare function edits2 ( byref safewill as integer, byref file as integer, byref menu as integer ) as integer

dim safewill as any ptr
dim file as any ptr
dim edit as any ptr
dim debug as any ptr
dim views as any ptr
dim compile as any ptr
dim menu as integer


if safewill then
   print "safe will", safewill
else
   read safewill    
end if

if file then
   len(file, "fb.read")
else
    read file
end if

if menu then
   let menu = len(file, "fb.read")
   let menu = len(edit, "fb.read")
   let menu = len(debug, "fb.read")
   let menu = len(views, "fb.read")
   let menu = len(compile, "fb.read")
else
    read menu
end if
	
end function 
#endif