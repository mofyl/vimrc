#!/bin/bash
 # the generated cscope index files also include go standard packages
   
  if [ "$GOPATH" = ""  ] ; then
		 echo "GOPATH is not set"
			# GOPATH=`go env |grep "GOPATH" |cut -d "=" -f2`
			 # GOPATH=${GOPATH#\"}
			 # GOPATH=${GOPATH%\"}
		 fi
		 # echo $GOPATH
		  
		  go_pkg_src="/home/m/Documents/go/src"
			 
			 find $go_pkg_src -name "*.go" -print > cscope.files
			  find . -name "*.go" -print >> cscope.files
				 
				 if cscope -R -b -p -k; then
					          echo "Done"
										 else
											          echo "Failed"
																         exit 1
																				  fi
																					 
