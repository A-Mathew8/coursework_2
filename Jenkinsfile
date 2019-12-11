pipeline
{ 

environment 

{
	registry = "amathew8/coursework_2"
	registryCredential = 'dockerhub'
}


agent any
	
	stages
	{
	stage('Build')
	{
		steps
		{
		script 
		{

		 echo 'Building File'
		 docker.build registry + ":$BUILD_NUMBER"
		}
		}
	}
	
	}	
}
