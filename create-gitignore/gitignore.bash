function gitignore(){
	case $1 in
		"init")
			if [ -e .gitignore ]; then
				echo ".gitignore exists" 
			else
				touch .gitignore
				echo "/node_modules" >> .gitignore
				echo "/coverage" >> .gitignore
				echo "/build" >> .gitignore
				echo "/vendor" >> .gitignore
				echo ".DS_Store" >> .gitignore
				echo ".env.local" >> .gitignore
				echo ".env.development.local" >> .gitignore
				echo ".env.test.local" >> .gitignore
				echo ".env.production.local" >> .gitignore
				echo "npm-debug.log*" >> .gitignore
				echo "yarn-debug.log*" >> .gitignore
				echo "yarn-error.log*" >> .gitignore
				echo ".vscode" >> .gitignore
			fi
		;;
		"-extension")
			if [ $# -eq 3 ]; then
				echo $3"*."$2 >> .gitignore
			else
				echo "*."$2 >> .gitignore		
			fi
		;;
		"-in")
			echo $2"*" >> .gitignore
		;;
		"-not")
			echo "!"$2 >> .gitignore
		;;
		"-help")
			echo "gitignore init"
			echo ""
			echo "ex.) gitignore -extension sass"
			echo "output :  *.sass"
			echo ""
			echo "ex.) gitignore -extension sass /style/"
			echo "output :  /style/*.sass"
			echo ""
			echo "ex.) gitignore -in /vendor/"
			echo "output :  /vendor/*"
			echo ""
			echo "ex.) gitignore -not /build/"
			echo "output :  !/build/"
			echo ""
			echo "ex.) gitignore add !/assets/img/keep/*"
			echo "output :  !/assets/img/keep/*"
		;;
		"add" )
			echo $2 >> .gitignore
		;;
		*)
			echo "use gitignore -help"
		;;
	esac
}
